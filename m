Return-Path: <linux-renesas-soc+bounces-33331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLsIEfxaGWoLvwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:23:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C6A5FFDD0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C02993097FE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 09:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268233AD520;
	Fri, 29 May 2026 09:20:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A3D32692C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 09:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046459; cv=none; b=L+OZQqIPuQ9JSGVrxpfwZDRXiHam0gGxtuQGjCpzac2huWEERXkICOfCxbxCBuM10J13sCxMK3EheNSklW88oUDU0JTvfiL27oOfhTlBfwREDRYNyUyXERHskHN9U6NaAoy/cO/PvrLKOEN9vueB/1UC0rsEnDJA+/x6MYL/vjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046459; c=relaxed/simple;
	bh=PRq6i2gXASoWwMkRzIq12yyh0AXMyNkbgK1/AHsxhzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z5b61V/SzDEOawUKA6JMtnKgBn3w9JJWFym/eP03UYS6Y3x2vAln3CsReaEsvjS7l3qfNGiAIXNWn1Zi7qunuIVuQYPluSTTyLvAmRZaD2v4rfCPovO9EKZ5tXVB9oNCcDfUJcmIvGY12BLIkkX3O/TruEAxUzABeb+hINNYhgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57533363201so4611924e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046457; x=1780651257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xueodFuWkXkoQ/z92fB1Zs3IyOG+T8cVDetfkk8StJs=;
        b=ceAgaJhd4i5bUcRRgmwb9r075vNQaJEeoby64+EOTtRlhaY8L0eYj6p2mI+Gi414+D
         r2+1I1TZZKVjdPHjCU7K3uqZPc9TMh/6GFwCvmedpuM2CS4NXCVaYfvi6ZWflQJ/3Pyy
         o3YKH/UpATc1rpFnaeEG3Ws1EmmhxNreyPQ0Qbyhht1cOcfW7oWxxADM5HhQvthXeBA/
         dxV2VSfSzemGxKdtQ9hzol1IJ8zjKPK0P8N7i61sBlylRrQt/SqithbOGUqn58VzS0zx
         NpX/kZKH7gyF1fWLss2+MHuEx716K3Glj6bDNHio1+Hy0JNtmrTZ1/uxWAzH+x1s2m2C
         e4lQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nSjNg/Xq6zV6go75J/ZoS6597xTq0afF5wQbECadbXOBpmN2ZoXCeZlmLdai6RulnxPRl7dU5whnZgxZ+Q4t5Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsgI5Ieonrh43khvN64MgJ/em7Iro2A9U5CrK9EOKBfLvE9zLq
	wd2rKrgqAiAE0C+ZXm+MHxj7DT/57YirtI1ft+FahWPSZNejzYUMNSKb/VSeVRUF5ck=
X-Gm-Gg: Acq92OFMoQBBpkGxiciSh2kCZPuopj82swjhrGd2luGHjNtSPFyCI5pm1wvW6VD6QX9
	1icieOq35QDo/aLlEGATDly3PXY7OqdYOi9fxk4AHzsBnlTkEoCTuleSetBpLtldHWMbrqrmpbQ
	pABND28okFxH2gAnp3KaJx7KGZOK47FcJDmEro0U+vVb0EMsBZYyXw51m7SGyjWmKucGOR2UZjq
	HTarQkmaY7+3DBel3ESzW2yo65Bu+Ph6viyRnuT+m+eCf1CsxvMuOv7GcHidwYCD8mczVgjdL2m
	OgUnXphS6snNMY2EEy62TxsqJbLS6HZoOojn1fmxfdynbKCrsHCL27WTdvx8Uk5yqYqgJqzqWUT
	fR9fQKO9cxMRXo2nzI8pbU8mWdogI2SM6Dyu1wEhzHnQcT+G0mJfWG5WIAo+g0217KjUIbqEu8w
	MwP3llEevwKQ9aVD1/1SvhGQHXriXsg9j2s+pNuyc3kX9KdzMaQvNPqeWKTLpLOlnA6EuHcSM=
X-Received: by 2002:a05:6122:d19:b0:56a:9841:9f81 with SMTP id 71dfb90a1353d-599f0826b23mr702447e0c.6.1780046456923;
        Fri, 29 May 2026 02:20:56 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d4754039sm956087e0c.6.2026.05.29.02.20.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:20:56 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6312a0d556cso6453499137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:20:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/WhPWQSsHun+K9AYqxhPNNBlEBCjsQGvMUk+/noNRLqU7WmPGyR8G+SzZvKydk1wickiSdfO7L8hZeCQlPo5ekMg==@vger.kernel.org
X-Received: by 2002:a05:6102:3591:b0:607:4fde:1921 with SMTP id
 ada2fe7eead31-6bf485aeab8mr513831137.24.1780046456060; Fri, 29 May 2026
 02:20:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528074615.91110-1-biju.das.jz@bp.renesas.com> <20260528074615.91110-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260528074615.91110-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 11:20:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRcHO-UPQt2iqDEtV7mjEwWswb+dveKwBtrj0DdZ=nig@mail.gmail.com>
X-Gm-Features: AVHnY4IMsBpJnZSc2sJl6Y2vvnth24kAgKugtJrt_UCspTkRJi08dEXNPqnEnRU
Message-ID: <CAMuHMdWRcHO-UPQt2iqDEtV7mjEwWswb+dveKwBtrj0DdZ=nig@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable audio
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33331-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.980];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:email,mail.gmail.com:mid,glider.be:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 98C6A5FFDD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026 at 09:46, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable audio on RZ/G3L SMARC EVK by linking SSI0 with DA7212 audio CODEC.
> The SSI0 signals are multiplexed with SD2 and are selected by a switch
> SW_SD2_EN#. Add regulator nodes regulator-{1p8v,3p3v} to SoM DTSI for
> reuse with eMMC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added guard for snd_rzg3l with the SW_I3C_EN macro.
>  * Sorted ssi0_pins.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

