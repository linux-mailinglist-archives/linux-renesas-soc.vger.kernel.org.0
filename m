Return-Path: <linux-renesas-soc+bounces-30377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHKmCLRaxWkk9gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 17:11:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B33B73382CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 17:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 401C1314C2FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 16:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EC340759D;
	Thu, 26 Mar 2026 16:01:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB4640759A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540884; cv=none; b=fDJs3tHM/MLn1LGSylw2F9PAJHZIvvikzE4tU+Nqua59ANXXhsjv6PNExdMPX9SLksGyftOu8yUDmKOke3R/X+gC0sO79t7tBSXm8lWNCfjJ921MAcPDlErjiJr9WHQmTpyEok7iyewqre0F+CGsZllgfQOFnHaZgM2BXG9+noU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540884; c=relaxed/simple;
	bh=nJJ044CFG8WFf7uTek+YoTRHmmGxlXFM1S9hcGLROjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bW04QNeHGaDMSEEGFIXbfWZFxdKhGPdXTQYrBbHNHiK0f0gMDd91UQdamwZFbY55OFjIBXwhM1bxk9mgr3A5JGQAu2VEUlcb1CPOwzm/1dpG4ciKYr+GI0whiFOt+j4EMRiRn2r/wLLVQHpSDEVcmt/EpPZrFrgmO8K3PAMVopE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56ceded5a11so437784e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540880; x=1775145680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjJkfoCYmqHBebtmH7jbwGZvaBZg+X2t2r1EMwQ2wHs=;
        b=CknkCfnMDeGkFFp46iojfkSvqlmlsfTngeE9uCj2CDPbl5OK1zDWedG8GakXQDM/BH
         9ukEttq72JhNWFPyPR79aJO+/Qe/ZbfgkWswZ9OEUoSFFugfOTwGmcjNzrTRwYnKycvN
         awPWZO+a98pKh8ayuDKcNb9MBgfC8lEoiKikQJHkF3wQaFECjjtKAzPF8I2yMgvo6TuO
         NY79tx0YEGuqIJCXf4c0MQdQNU3d6OOhSLExKQh033QBgnLlScWy2jLHhXSEqQsMvhG8
         m2L/FRtrdNKHfp++PYHeTUqbK+VU+FVMnqmNZ2FoDnzRz0WsvNsbBSjHkLaea/L8zVub
         0N0g==
X-Forwarded-Encrypted: i=1; AJvYcCXSYjVUuUcGlGm//ob+ugwDJFUGLH2vqElfVR0rAw8GAUyNtGRS+OG9Y2syFOPw7d+5AfMTICO9y89i7DULplocxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfzgmnB7NrAs63DLPh+KwPQ1xwZjTdxb5rmlMslEP7kgE+tNxS
	Uv+OO0MaPOxuKLRnM2kp3M1kKQ289+cl2JZYH6uU+5MAEl29L43Cl99fADYItEewVAo=
X-Gm-Gg: ATEYQzxDw0pQtAP4ePucpBWwGb7XlsFChBQcunqRdA5OQR313vwNjuFVkmXKMahiWdP
	RiBxJ+YPevNYc5PX649/IaWRkVmVb3swijJzGeUt+ZuWV1XjHYh7ABl692kMRcvpBoQGNDLE3Rs
	DnReUcPXE0Oq5qP/5SPZaXN3/3XXrFbwx942BlB5eVM1O2Yn3od6uteUV05G0R0Vl4CIQBKWErT
	MVzE+VmormV/4qwzMGpzqmEgZJnlAyRT28JQmv8tWk+Wpv/qtsNXEDx4wyhXO1J2deNDYjImgPf
	oPcFk+4OcgXcdPwjEskhVhx4jA37WK/JC+VUBidfyiaBddSlYQSh+UchmfTtgYydISN3A/N19jA
	57eFFV2z/wUEGfg3sSZpeDQPrQvQKM5FbxXGzQwcpjxD3HDrYhs6ZpVjA4KfL8kiNSJm1kuYYJr
	u9zrgsvmGT7J702d7vsMR1V4K/ggE/XGNFw7MDDSnswAhJ6ERlXs+WRldcID7/gu/P
X-Received: by 2002:a05:6122:3481:b0:56c:d58e:8c0b with SMTP id 71dfb90a1353d-56d2208b18cmr3485574e0c.10.1774540875495;
        Thu, 26 Mar 2026 09:01:15 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be5afc43sm4022832241.13.2026.03.26.09.01.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 09:01:13 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a857578a8so515301e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:01:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMfrUd+m5pm2U3DMiKWZ5DCltc4YItM9kvCBAEsbjkxM/O0PUjRc9p7GHomx7/PnMfqhzm4CN++MzqfHViWqnVuA==@vger.kernel.org
X-Received: by 2002:a05:6122:8c13:b0:56c:ce0b:fecd with SMTP id
 71dfb90a1353d-56d2208bef0mr4303675e0c.12.1774540872761; Thu, 26 Mar 2026
 09:01:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260319141515.2053556-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260319141515.2053556-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 17:01:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXeRRWi1g72p_2Rq-dYO=pD6aLkWC-x5fZpHa7WMQZR2w@mail.gmail.com>
X-Gm-Features: AQROBzAu-o_sjRBfd6AHvLbmqr0rTNnVFjjdYlB7t2PFooSBjTFI7oEHrcpJ_Zc
Message-ID: <CAMuHMdXeRRWi1g72p_2Rq-dYO=pD6aLkWC-x5fZpHa7WMQZR2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document
 pin configuration properties
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30377-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: B33B73382CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026 at 15:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the pin configuration properties supported by the RZ/T2H
> pinctrl driver.
>
> The RZ/T2H SoC allows configuring several electrical characteristics
> through the DRCTLm (I/O Buffer Function Switching) registers. These
> registers control drive strength, bias configuration, Schmitt trigger
> input, and output slew rate.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Updated commit description
> - Switched to using the standard drive-strength-microamp property
>   name instead of a custom one
> - Added a description for slew-rate property

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

