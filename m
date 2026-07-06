Return-Path: <linux-renesas-soc+bounces-34747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yTeCH/qES2pWSwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 12:35:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 801D970F400
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 12:35:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14A6330F561E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 10:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A30302140;
	Mon,  6 Jul 2026 10:08:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880842874F5
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 10:08:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332494; cv=none; b=M3151FcCSTATBX184aPAYODXrTaXH2+pQGUTRxmT9pLsh2AiK1PmGSuuMOSAp/s0TZT5Ibvd2hExNACMlsc2Eadu/+TVeI5GWa5kW1e/sJIBZXoIT1j2F4NDOFKChMy1wXODOB/nss3xYh3difQcZJZJKLf6/SthDY5Mv9Wjro4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332494; c=relaxed/simple;
	bh=OuqZyyZKufM5tKG1k1Tw0fhDCDN6LUhX/VwEzqtgzzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFR4v0/fkDvDRHlpIn2F/B7MtZQoUc1nVD7PgT+cdZrknDgjRjTPQal+G0ADNcKPu4O7H7FzaNcfDlcncO1Yb0CUGP0UM70U74F9w8TYizonl2m7eh77uLV+8wyByvnSfkxY7bsOaf+F1PnmaNeWEpSslTPrurIJ5o5q8F9swWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59ccf81e6feso692682e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 03:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332491; x=1783937291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Avfylhoyx5tqif2j0s7EGdPplSscPo8mEJ2UKFsFj5Y=;
        b=LYuwE+UHifO4IukxqcVR4sEEST2rqlINsyM8W0Dv9O0OWMKSU2C6Eeec+SX2Qw/05M
         HB3raeCh87NGrMN7YpMjC8xkCFXbrLpdlrz77QzhK0Y7OOLfSAuGRxWbuEfDZdCUSYDs
         Mk6s8xzXRikqHzppxVDumJ3pZaoP3zaoLc96fSvbIygjzbLrQcV3q7YZxAb70u0+DCk5
         wsmRNlIgki3pEqYSPiHhpCBzxZDd4W2ePsshw1gz1Ou/1T2hI5B8j5/la+vIHI3xdN6y
         X3HufdyiBljcN4e6er+jGSuYUUHWdiNEADXJCEg9RHslu/3x+n44I7/318B5AhCUY4z7
         GaAw==
X-Forwarded-Encrypted: i=1; AHgh+RoulIyfcUaOmdzqIaVGI7LYEjAIJrjbAVV1QfHuBrga89naGA/WoiAxsSl568SbK2er/Gz9T9IAJTNXoCRgWjKLpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxItSQDtTDxKJhsUW+tHXlmcGt0UuYkPGye4cvj32hDiEj2gYd6
	jcypcbSzKhHhu0dPNWLrY5vlZiJKUOS5BlloRQE3W8zieZqqoF4i2Zx1GK0JS+mH
X-Gm-Gg: AfdE7cnzYOzlCVzfTdazifFWrblw41CArhWQTONVRQfX6TzJkVfe3Yi58Op1i3jSaWb
	yKnqVTJhdZ+UT/rtZzay3JYMnT1wrBk6FPOS0kihPH44WWZJPSZhFjxBp2mWiBrmlw6Z8bkpSnx
	I+cmqQzpoqBNClTnAaeCEDg9r/vS+30hPboTXutlIGa7/QTGiIcUaoSmjTtYiZuHsf54NZuM1V4
	7q1xFmySGKMYcbLdZa3KEimxtVJNZJ6h8MyzqpcciG0i37ZfDFPpuiWdDvFtP3JC62gTJdOePMx
	/dqGpjtxrAt3L9sac6T93TJsmk3Zq+8zOfgQu5RaxlwmK9IkkpgXERKoGp8o9exban6GHK5pmmt
	cIbcArPjosWMprRyrxXsjHzIUfaOH1e/Axci8Ytu7Mu3642dq3tJTwTeVKWhVCZgXi2eIIvtvlc
	zcS3mNiAL3QQu8TZgDlv5BcY+zjt+5PdOrX5xw2HyJYBTnPK6tmg==
X-Received: by 2002:a05:6122:1798:b0:5bb:d01d:451 with SMTP id 71dfb90a1353d-5be102d7fefmr2779916e0c.10.1783332491451;
        Mon, 06 Jul 2026 03:08:11 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be02998defsm4655384e0c.5.2026.07.06.03.08.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:08:11 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7389cff36bdso556015137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 03:08:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp0ib9POFNAbQwZxSW7F0L+DrGvKB1v46CLHtQWQZ/qNdF3KPJIE/zU3H/B1k2aMfvACVwFfzKAHfFO5acTDXa8YA==@vger.kernel.org
X-Received: by 2002:a05:6102:292a:b0:73e:9fae:5844 with SMTP id
 ada2fe7eead31-7427f7c09f6mr2718808137.27.1783332490185; Mon, 06 Jul 2026
 03:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 12:07:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTDRkq-WaXNxGzBLAEY90cn1i_-UOuDkS3PBs3xKooFg@mail.gmail.com>
X-Gm-Features: AVVi8CfVUZe5-SeycxEAnrifXns0jujcFQ6mtVZEjh3x46p1vCjwJsZir-4zskQ
Message-ID: <CAMuHMdUTDRkq-WaXNxGzBLAEY90cn1i_-UOuDkS3PBs3xKooFg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/9] clk: renesas: r9a09g077: Add SYSC regmap support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34747-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de,vger.kernel.org,bp.renesas.com,renesas.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 801D970F400

Hi Prabhakar,

On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add System Controller (SYSC) regmap support for the RZ/T2H SoC.
>
> The RZ/T2H SoC features two System Controller (SYSC) blocks that handle
> low-power management and access control. These blocks are defined as chil=
d
> nodes within the Clock Pulse Generator (CPG) address space in the device
> tree. Implement support for creating regmaps for these SYSC blocks.
>
> Register the regmap using of_syscon_register_regmap() against the CPG
> device node so that consumers can access SYSC registers via the existing
> syscon phandle.
>
> Add a sysc_init() callback to the CPG/MSSR core to allow SoC-specific
> initialization of the SYSC regmap.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Made use of for_each_child_of_node_scoped
> - Moved sysc_init() to the end of the probe function

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> +static int r9a09g077_sysc_init(struct device *dev)
> +{
> +       struct device_node *child, *np =3D dev->of_node;

error: unused variable =E2=80=98child=E2=80=99 [-Werror=3Dunused-variable]

No need to resend yet.

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

