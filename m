Return-Path: <linux-renesas-soc+bounces-31331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJATMjvk4GlhnAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 15:29:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A0440ED50
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 15:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E59A3026CCF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 13:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438A73BD64D;
	Thu, 16 Apr 2026 13:29:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E33F39657E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346158; cv=none; b=aSwdXf/WWde1z1OO/vOa8yo/DlP8I2VM3DBF6VEXuy3BBaHP9h51dikbG3gjhVk3Hw35ncoPs+pR8FziQdTSq9Tckr7hYbAQZTN1ZFYGDMKR0FPK4zuQHQZCEh/cz1xgu554vJ+91OnJLSX/ZB2ukwDbEwh0Y/hzn/qxJaHy0sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346158; c=relaxed/simple;
	bh=BwLy3QWVuZz6CQxVJXML2dqWSYpitm84zDLd0IAaxHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pICT94aW+SbVy1P8etOXMcQ2gUVYR0/YQJPaWFryN2jEIDfMjz8TVD8bUk2b15RQuJ0FT7TKZdiJgGwu1Dduq8NCNf0wyr+SshANhaBxjX/V3G5jY9xBHDWMLRNDxARW8JLOeQhqus2CabPwY7yH2n/r+yQ1tDJhOF4+xCGkBCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56efdc96b05so5109653e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 06:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346156; x=1776950956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iMwJveC9nUYlrG/1MYdDO4Xf7VKBcGQEaEbR06Vcs4=;
        b=sZdFudhgtksqLnhjWE/yhsqYuxqf60LAKQtawvqjbInuqdrMXFdjHBIWghM+VJwocG
         J9jlPJX044v9hfm6Cs5aF1ZQ2SlO2carjpErA2xFD62NknocMGC7JmG69UDaB3L2/ayg
         YQuqQd5paSu5xJGwyo2JRAntUtVGAjJlTRP+78eIwN70KkDQ3NXa9CxJEQK7gVUdi8Fx
         SFbrt2kn9kIiRStlr7cwCYS+oMIyf8qA86SWyUUnTKCIeBGaYC/dvwq/dV7G/QpMbAlY
         zikzzbeec1LTWEmhmL9N8YSwkfej9WFUeCYzjJHU3GxNYNH4ZHtTcEV5BmIQZ+4mp0BN
         pF2Q==
X-Gm-Message-State: AOJu0YzaiDvXYYhfo4n2iUQhlHXAY8s8eXGdiDN/krD2aXZhfHjQ1WMF
	SRJtkgR9gZla/kYcwiloIQvxCbmb0wDt0je8F9KU6ijWIPXFQaIsl5aco6e/xIei
X-Gm-Gg: AeBDieuJv/ZuR2AaMGQ16dcvQneyxRlPO0yBi+Ucjl9GUrPtT3/8e6g11yCjuYh1gfC
	Emlyo5Df7bUboRJVUog2zS3bB0q3EltVfYLVIn7jeZ+0JfEmJKxe4fsFc/pQX4bA+fsEYfDP9nk
	UlHngeUaYS1C1k31BFvkkpB6l2GWFjyk8VtVDUfqqSWZqBWg9Cne2uJtJFfxF/1Wl9jVqAJoI5q
	u6oX1KxS39ou5Um2ht1MtGTbZBE52QVXnBnruLnmXE40VVlYO5yLk+8S6SulqQdjRRw0+tUpW4p
	5Nw+HMNukU3YaFFOgcouDAk2R+YQhKJ/5A2NZUBfgfe5sqMcy9vliNd81utp+UKBMl9GtqzcLQz
	7Uza57RkB8NXEMsdKT14hB3hNNfzN7aXx+5MGmz+fFLudf7j7mjDV/jNZFrKlvc4KE1U58bq0zG
	WBGGGshdtca5lJMSO09lePBPoaB7Vz3B6kIE7VdGOIPBT7/UwOt19XvEJ1RqmErgixE45lxneYz
	ScyFV4mqFdxRQ==
X-Received: by 2002:a05:6122:e24f:b0:56b:815c:961d with SMTP id 71dfb90a1353d-56f3bb904c1mr13782738e0c.5.1776346155931;
        Thu, 16 Apr 2026 06:29:15 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f8a032227sm3340656e0c.18.2026.04.16.06.29.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:29:15 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56efdc96b05so5109617e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 06:29:14 -0700 (PDT)
X-Received: by 2002:a05:6122:1d4c:b0:56d:451b:e4dd with SMTP id
 71dfb90a1353d-56f3bcd5a16mr13216034e0c.12.1776346153996; Thu, 16 Apr 2026
 06:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413104240.30493-1-wsa+renesas@sang-engineering.com> <20260413104240.30493-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260413104240.30493-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 15:29:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaAu82OQXdHEcDqx-0vEYhFGSbxmdHpE37ZP31FzwEsw@mail.gmail.com>
X-Gm-Features: AQROBzDvU41svUv0b_b3_1bohvOv2kjJGBhiJuiAKU9-WnDONaVbG5vRUsiiZO8
Message-ID: <CAMuHMdXaAu82OQXdHEcDqx-0vEYhFGSbxmdHpE37ZP31FzwEsw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: update kdoc for struct mbox_controller
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-31331-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,glider.be:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,sang-engineering.com:email]
X-Rspamd-Queue-Id: 68A0440ED50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 13 Apr 2026 at 12:42, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add field for missing lock around the hrtimer. Add 'Required' where
> the core checks for valid entries.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

