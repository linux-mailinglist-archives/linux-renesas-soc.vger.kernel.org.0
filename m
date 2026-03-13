Return-Path: <linux-renesas-soc+bounces-29348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GVpGuYItGlvfwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 13:53:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DD3283472
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 13:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09E2D3021434
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB48039020A;
	Fri, 13 Mar 2026 12:53:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65895372B22
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406431; cv=none; b=qr3VlxirXdtfEdcCPIUfukJm5y239UENxX0d377HzrBjtfGadzmaJOmdIqKDeBtdNL8DBUNdGbwALqnhSfcKVQITDLTrWCIwhOUGyqUUr6cXZAhvxoW3r4aImY8fNCL8Eu0reRzaxIrvCVhNu7dC+DUoxfsuITlSIHv4r8Fjf2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406431; c=relaxed/simple;
	bh=8rq06JxfrFpH51tUDdZ56ATkYOqHyIb26lvvkq7tmGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEQ5OVLFf5HCg8wRLx6mSrwVa8KWyx0USBDNeBFjS+gCNQ6rZj16tbiRVTrJLmYDnZcWlMQuK5GIl8lepEncPle+Zna0b2bZbAEQwHJXwmjE7In0q0r2YHvOHZmUNoj5BTUzNo7t8pPsDlxenjSssJofHO0Py4YrBBE1FjnX71M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56b679e72d9so174130e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 05:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406429; x=1774011229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzhS5znyQ4J8DxFN/iWbL5i4DD4D+4iNikfaPIuXlEw=;
        b=HvMX26sBRr2+WZNsH4MiZpEN0Y0pEGdcjlh4LRap959D1p9em6Hn3eAiVvjN08OKOp
         WQuWNzl8NgBmfiMQYlmlC7YoPGB39UtSTN7jg8D/g5FSChCyt1e4OW2c+sPyY9bRolon
         4+cVlBobRMQWTnPkScI1LxC6gMZ/+AqPgOeN5MInwt5D4B1J/sn2qeG31anqgMQHLa6G
         FCWdl+5C2XuVLogtZphoZkQ0TiMi2vJhEqLKAU05PFXClLpMlvH+ibWcvi62sluxfnrl
         KkeYl5CNc8FWMmn3pdZ5jhjL60tKDL2NOXcRLAi1tPCq5MALHzbg1sToukSSCu/hq4eu
         Np1A==
X-Forwarded-Encrypted: i=1; AJvYcCVXgpFhc29bJ1k8QCaPGJtWSvG3TaIMFiXlFGR+G64bItCdD+AMaxLJTJs25vw9o50omVnycZdtEmtQEnBdugqFUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrvom1fq3oBewN/kBCFCDh9/hNdk6rueLjLlXLNdWOphV1sJB5
	rYH9cVKMy8b/ciewp0Jq7s3bK/+VJMWfJ7PsxtQ+fssDiZucb4H3GVrl99+O7Ni42IE=
X-Gm-Gg: ATEYQzzlULa1aDwUdV5J8QGPnNUzqz/4qVOsGHh4cYkBv3y9ruvoN+dK/4ig1zc+Q4k
	Y4L4rg4dHTO4luRYJVRWTQ8FnPtd3xhUGAeasR47ja5fdyJKGQcSjtu9V/YoEDcVCRCx4J9dWE7
	+e/5r4jDvgDFyRmR1kJX5NhltL/e+7+FxlLDBry0X4NJBVBY9zIyTOv2P1A/5K5ZrNuSsiH287H
	maffk/nwB1YZ4U+zp66F0LPdoewGw7ffTVJ+K9dg0bCp0IDQ0rfLM4FnYio3rg5e7aQLv8lsH66
	/6YO1EqWL6oeD2CtAz4QAx9BCSRHOQwT8t7TCHZb9oJVkuFEuHqfb052VnHZpJtqKKGaWtBVDaH
	qqDigWEwmZTxSGBWeo8AnaFLaewQ23YK/wMbm7Ej2J7Koxo39w64hRyX9GVnmstMF6Wa4+cDecX
	WHe/NIfnpsZ5s6ur2Yl6rBDAFpWA0J79hq70Kvc2TebC1CvPsY4AyCJSxRoNB0
X-Received: by 2002:a05:6122:3286:b0:56a:e0e2:69b3 with SMTP id 71dfb90a1353d-56b6268f695mr1095322e0c.0.1773406429042;
        Fri, 13 Mar 2026 05:53:49 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b4645d11csm3648301e0c.12.2026.03.13.05.53.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:53:48 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ffd76e4c89so499593137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 05:53:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqKFlyX8lVcBX1NPM/PiP756IVjYF/rY/2BYCmSpN+55bJfyL/fwwWQQu7osLT5UOzxHfWtA1cMrXcDQAIaSLUOA==@vger.kernel.org
X-Received: by 2002:a05:6102:6cc:b0:5ff:1f6e:6278 with SMTP id
 ada2fe7eead31-6020e564640mr1149943137.34.1773406427742; Fri, 13 Mar 2026
 05:53:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309165946.3003731-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260309165946.3003731-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260309165946.3003731-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Mar 2026 13:53:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_4nNgyJYS8=hryTjT7WOw0EAQfuLkjVptsdgu5+14zw@mail.gmail.com>
X-Gm-Features: AaiRm50NcMB6g8UsGM5BlPXvneOIHq3zI3s2mWxnLPgrYKIn3c20smBYU5t3sK8
Message-ID: <CAMuHMdV_4nNgyJYS8=hryTjT7WOw0EAQfuLkjVptsdgu5+14zw@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: renesas: r9a09g047-sys: Mark rzg3e_sys_init_data
 as __initconst
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-29348-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 07DD3283472
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 9 Mar 2026 at 18:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Annotate rzg3e_sys_init_data with __initconst as it is only used during
> initialization.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

