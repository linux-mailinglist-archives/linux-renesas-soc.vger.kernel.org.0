Return-Path: <linux-renesas-soc+bounces-33189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP6yIyqbFmq1ngcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 09:20:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD655E05C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 09:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20DB8300574B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 07:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A333B7B7A;
	Wed, 27 May 2026 07:18:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B74280A56
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 07:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779866300; cv=none; b=ZD1WAv9JMbDbCqvTaY4sCBDBrH07a/1XpsRmOhqmDYgCGE3cwicu+brxYkZ3Uc/cdDab52Z+wiGX8gaOaZ3+Yzh3MrWl9VD1RiGlaT3U8LSJ0zMiZb/b4u4Be9jqtI441CpBBfvyLARCyt5MlTbDaXrR9zirFWJo1aH2OEwxy8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779866300; c=relaxed/simple;
	bh=Dao9kdOrtlJ45gmh2RbDmGbQQTZZO+n/rTm5/im873w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oEkw6aZFcR51ix2WbpavSyTp8irjZMwWYi/ddUJmkdrGUcgihUJ1kZrNRjUyvZNK/5BEB8rlLx+B/sFeSTnkqAkXb4Zo6mo1fMONJaAyns3lyokrGv+v9Ge3Kn0E0iKuiD0aia/ZoUTlwNmJ+mz/sT6oukTWH2gKcguHJvRUomU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6314a0eefb1so3628045137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 00:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779866298; x=1780471098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sy2hrrBG21BdHck1YdIk1SaSJwWCDlg+jpuiQs79vfM=;
        b=S/TrtaUhAKnjLvxll15qeuAR7nUxvoyfIKch6Bn3SaX0tgVf5+7Sf+za2Yc/cfUoUE
         2mElGmURzLhcw48EGrrAq+wBsdUTk5UFcarHHzIS+o4Rbha78K5mbhfmf+tLDJnXvpGV
         i9vZXGDXOL3dcdJe4oa0/18vmd7TxWdUGq+lr0wBR3ondJHVzVgs+jdW0/4c/k/bStB0
         d+ZeX8SdCtegPlvKGNQ/ycNmTV6dKsTV4CKcblvK56f2OIi+YZV/vqFM2F63UCDPcXZo
         tD9GXnUiVHAJ+3CospPFHjk2wjhQGsqAvW0blqhggjO6hwblGtKEINgvas8c/stAyfoM
         bEIw==
X-Forwarded-Encrypted: i=1; AFNElJ/CMioElOfcvO2Yu/g6ojOf0fEcvOy5I/OYwuCf7fmBZN1OjZ4juhYtfiXo5oIdP/6h/vD/UAPn6s5+ScnR77PhGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzck+WxBOwry1/ixRkn+zHoDa0Qe9o0J1IIXvKVgkR4rD2QiR54
	1JDtW/5W2Ad2aVnNG+MvUY4FLTeg+0tP51JaW32s8zKBH0viyZlKHU58PWpDsj975Fk=
X-Gm-Gg: Acq92OG/SoxFeMP1nHKt/mXCLCgnw8klO68r1KCcFuzKT6dDLhtCx7wd4RFLzuMBy3f
	DzJzIwNRKz2G7sofnrvIEfzwOoFWCrkZyW/36hDijUppmBUClp6OsCLGT/VLojCN5Pp/U5rhWmF
	uypEwXkHfrCG48FAB89Ola+/JOSqR9vOJLlriGtdK0FZ/c/c7oMkZ8f172NXhd79G/V1vPDI3Wr
	jRIzHlU+yDH/XxVhQ7CRoSJvvemSqbuyL9rf+O8ufX6QbsDd/+btt9tTdufdH+xcrz7FJC74GCM
	mIqIq7SHtcuQM1ZSExWBQIKg1GS7tTcomV5qep3b8elBsPtZ55arShyIeW0rlG7BX3+CHajn/Vk
	kZdmPrg6KMEbTk0WfU+DjregmX2jeC2j5F+TiKV09zMfq26kYkNgfcFmaPu3F5twt17jSvNOYlB
	y682R6kUf9MBtrSSHY0KKMNRvaD7qety7C70CF5J3iv3Q2N8sYs0ne/lxjz+sNbXsw
X-Received: by 2002:a05:6102:5114:b0:631:23fa:38d7 with SMTP id ada2fe7eead31-67c80d66fc5mr9909911137.14.1779866297741;
        Wed, 27 May 2026 00:18:17 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961cc2b70e5sm3182801241.0.2026.05.27.00.18.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 00:18:17 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-57513733658so3865758e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 00:18:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/h/IX66eoJ53pnjoiXSstjvh3Uj2TBJ3IQoMU1eY7PKClKyUZkgUEznRJZ9TpUjS7+mEOZXvnVcVNUHnB5ZdlOLg==@vger.kernel.org
X-Received: by 2002:a05:6122:4581:b0:575:a5b5:3233 with SMTP id
 71dfb90a1353d-5865f154435mr10929054e0c.4.1779866296537; Wed, 27 May 2026
 00:18:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514125328.20954-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260514125328.20954-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 09:18:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhk2rf9+1mvdoUbd2T=vNC0L5UXeiEzwDPvfMOT==+mA@mail.gmail.com>
X-Gm-Features: AVHnY4IRt8fLyNfU8YOCQpYkCYZ9ntliUcjglmYbKUGrrnuUFeY-Av16LJkvBmg
Message-ID: <CAMuHMdXhk2rf9+1mvdoUbd2T=vNC0L5UXeiEzwDPvfMOT==+mA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a78000: Fix GIC-720AE View 1
 Redistributor description
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,renesas.com,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33189-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.977];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:email,glider.be:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 2BD655E05C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 14 May 2026 at 14:53, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The Renesas R-Car X5H (R8A78000) SoC contains Arm CoreLink GIC-720AE
> Generic Interrupt Controller with Multi View capability. Firmware has
> access to configuration View 0, Linux kernel has access to View 1.
>
> The Arm CoreLink GIC-720AE Generic Interrupt Controller Technical
> Reference Manual, currently latest r2p1 [1], chapter "5. Programmers
> model for GIC-720AE", subchapter "5.4 Redistributor registers
> for control and physical LPIs summary", part "5.4.3 GICR_TYPER,
> Redistributor Type Register", "Table 5-50: GICR_TYPER bit descriptions"
> on page 200, clarifies register "GICR_TYPER" bit 4 "Last" behavior
> in Multi View setup as follows:
>
> "
> Last
> Last Redistributor:
>
> 0 ... This Redistributor is not the last Redistributor on the chip.
> 1 ... This Redistributor is the last Redistributor on the chip.
>       When GICD_CFGID.VIEW =3D=3D 1, for views 1, 2, or 3 this bit
>       always returns 1.
> "
>
> On this SoC, GICD_CFGID.VIEW is 1 and the Linux kernel has access to
> View 1, therefore Linux kernel GICv3 driver will interpret register
> "GICR_TYPER" bit 4 "Last" =3D 1 in the first Redistributor in continuous
> Redistributor page as that first Redistributor being the one and only
> Redistributor and will stop processing the continuous Redistributor
> page further. This will prevent the other Redistributors from being
> recognized by the system and used for other PEs.
>
> Because the hardware indicates that the continuous Redistributor page
> is not continuous for View 1, 2, or 3, describe every Redistributor
> separately in the DT. This makes all Redistributors for all cores
> accessible in Linux.
>
> [1] https://documentation-service.arm.com/static/69ef3c1cd35efd294e335c43
>     Arm=C2=AE CoreLink=E2=84=A2 GIC-720AE Generic Interrupt Controller
>     Revision: r2p1 / Issue 12 / 102666_0201_12_en
>
> Fixes: 63500d12cf76 ("arm64: dts: renesas: Add R8A78000 SoC support")
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Update GIC-700AE documentation link to generated PDF
>     - Update commit message to match the PDF
>     - Add AB from Marc

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

