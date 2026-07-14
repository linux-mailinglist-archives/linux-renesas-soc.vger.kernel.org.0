Return-Path: <linux-renesas-soc+bounces-35208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ViN4MEM6VmpF1wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:31:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 205D075527D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:31:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NQ38ObsO;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9783312D16E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CE030BB8D;
	Tue, 14 Jul 2026 13:22:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C65930D3F8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 13:22:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035379; cv=pass; b=NoAWlk1k7mRuX4tHUk/bpFMpX+eW/xCJ35QNQmBA09qXORq3x6XtTIz1KXOta48OCDVtm6ELGIqKQsO5LFheR6YwC+LmXbL7YVGfJQboqc0nBaDGUoTS+sB+0SH+PG6Fe4jzsccB5yIBuO0XgE+VyaCeo4Nkcpz3HQXl2etslsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035379; c=relaxed/simple;
	bh=likGGf+ggWYG16RLVo/FcbajDunMZFr0fDET5ovKQVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WpcA5wssSd3X09sqn5BKFKhRzEErbHD/VE6oWf+4nYEztaQO4pidvliENyeq9KYikHfX+5B1QvN7G1DXaDma76BeZsm9cNdCRLN8VKiAV7tdMVhG6VQV+5GfUF0X6x5/hFkZ19VmvXLPj3PqoXKY5Y6/XhzAF279jfHu2Zy448c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQ38ObsO; arc=pass smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-475881b9a4bso857696f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 06:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035375; cv=none;
        d=google.com; s=arc-20260327;
        b=CBZadsS3Q/uso8Eg5WvSAP+j7ekyjPsQ0nJr7YtjprlPmq7w2rP46UtmvrxcpWi4IP
         i7B+lgNft9DyvpiorLmTtS41nnDqSTaaLwXBgheA4QOhUwlnzfETanV0/gJgN33wb0Dx
         GZvC4OGuZL13y+JjTuYKYkuic+poLM7uuA391/NlKw+kIBbrKOB58JaA+u6v31xnh7/I
         0xXXCQqVQKDcoXLIxHfa8lRQCBfEKp/ga/Mx5wZpdlsENz/nZTiVntZ3SSL7Xbbpkr8R
         0DfYW6HES54ic7DkGjAfhQwShlpCyurx90YeBiMyFWL5hVUBlcYcISVrwUC1HbQoG46B
         GNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QXEB7lD1Pe7mGc0NP7BMIVuEFyfydPaOvdXbwC8z9qY=;
        fh=5opgU3tBjxIt+iK/zkDi/tAb3jlGjBc+tEhSpX24/d8=;
        b=WFrXM5zNVAYt/sWsK1zigrbdIVWVRr950cyGh7PLfKyKbIxyx4cdBu9G1l8Oqzd1XD
         06ESSNEPcNZTGJBDnZGoz08pjh8HAywLdTY9JRqQFJmDa/O/l54QEsFG9vm/BF6zc9+g
         GRJ+NNM3WS+N0OxEF9CqbvV6QRfiRzapLA2ya40L40kagxpGIoD9YUCq4ux3s3WNEFCx
         6xQxYUeGUw1PEAgGxBIKN/jab3FxNY5qZsSx9CeewOnJj/aHl5doZ8AcKa1Gi5n5OlL+
         SzWbVyafev/Og9ymT/wRYHntaaUM7q/XkFB/9544KvkzIWTSKj7EdUxdyVDyUw/wa2RA
         X+sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035375; x=1784640175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QXEB7lD1Pe7mGc0NP7BMIVuEFyfydPaOvdXbwC8z9qY=;
        b=NQ38ObsOvFwVrbqoVD24TE2/27i0bu0G7Ec30C9jBx0tt5tZWmFLfgrC6xfF3lc9zC
         rOhmbPeZv63XGOVJ53YoXHmrUS9XOg237YBc1UwYaMyrerRVilWlX8M9RmBifxbvvVy1
         PiCBANHlBCLVOr//Q5LPGatjrvj00LT1VWyWGsIHIK3qY+NNxaMLbuS2OS8i5CXk7Ynv
         N7AIzaSfRYleWMdBNJ923GpVyhD8LBoYX74SZxh0ZUowaNYuiNEkmpvJJ/CWLNMQu1b4
         JRfv5rO7p6yWdx51Yf16Ty+220qZpLoHkkENmaLb/m1hq7uZ0Oc8aEcRG4WfnOJRubTj
         PkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035375; x=1784640175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXEB7lD1Pe7mGc0NP7BMIVuEFyfydPaOvdXbwC8z9qY=;
        b=LLDOl+irD8nuMmDsIGDci7UkEArO+uEpubMxSZotyRd3kbWRl3K9sZTvaf9btf+Nvg
         KjSPqUg7kUQ0g+W950Czgw2wGZGacmooJjCLtDZXbp/hukmw298i6WbYHTW461HCW0Fx
         MGYxwkxc064gJt/laat2eIQaTaHqdeGtq+yEVzW0jHY+RFlMqlpQicMzGWoe/m78pjf/
         aZbeIb6NdAjG0X46GTtS9kHiOGB42I/2uRxFFWhgScu12kGz00FM6qB8RYXdX3D27ur5
         dg/4aAqQNT0Tt6coliuGnfkd77a6F0R6c2oWyIppmZzIIqrW1ULVFM1S7f+4yZCGoonl
         S6LA==
X-Forwarded-Encrypted: i=1; AHgh+RpmYB2LxNOsghpclkylrMfJN35dHt8u5DX4n9A8MTg/pBAPprLNqbTfUKQ/X2sC3xt3WixhGybM5OV1jyBzTnsimA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvCtKKp5S7Y8wA9ui/Vt3YoyZBucKTbKQgBornWee/Of7zbN+w
	yEfjpGcCfxUxT0pbuQk36aSIoUjNWMbX4ksVsPDtOX8D1caLoBzblGoEGVf5Kj1vn30ZcuGzSmS
	tkgvSfk9R4eS7HPKztOfFFGpLGBn6Tvc=
X-Gm-Gg: AfdE7cmoULhj5kkPPInCDQZicypZ+9BZCrMX7ffnjABae65UVUSWEadACmOJOyRx1+U
	3U0nA+//OoK8KTbve6oZAc8WT2tjTNUWUW/S+jqVqZhX3SCsMas8kIsTFH3lI+3lfd67kFaA8VE
	Vz2zJT79uCXc5l9a0GxxqWSccAQPG4AmCh+aKaiLcUSkgxdayvnMQZQyuuAaLRcJ80tqChvRO8p
	uQRX6UZkTIIb1CxiDsHZQrkLG/YbF77aUlnPqNQP/0ZETtVGeuc6Rz9vzk0AprIHC0NlfzlysRi
	SXZW6GgARmqEZW05wOG8hlQCWbbgdwd5sANIs17zzdvBiIzBBKewrg4I1G4=
X-Received: by 2002:a05:6000:4b01:b0:475:f100:35fa with SMTP id
 ffacd0b85a97d-47f2dd439ebmr15117164f8f.55.1784035375471; Tue, 14 Jul 2026
 06:22:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdViSFTZZMe0SsC_aYmyZqTHCFNN0NxPVoNx5OBfwi4MLw@mail.gmail.com>
In-Reply-To: <CAMuHMdViSFTZZMe0SsC_aYmyZqTHCFNN0NxPVoNx5OBfwi4MLw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jul 2026 14:22:29 +0100
X-Gm-Features: AUfX_myvAV81_pgPn9QpR6gxgV9zHgZTebLUmHf7fq4pIgaFNeNRXJt-dYDKguY
Message-ID: <CA+V-a8tXUttE088QVKn3Ovhm0tyUEAq5ehBZgTjTrozvw=YSpg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/9] clk: renesas: r9a09g077: Add SYSC regmap support
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35208-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de,vger.kernel.org,bp.renesas.com,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 205D075527D

Hi Geert,

Thank you for the review.

On Mon, Jul 13, 2026 at 4:54=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add System Controller (SYSC) regmap support for the RZ/T2H SoC.
> >
> > The RZ/T2H SoC features two System Controller (SYSC) blocks that handle
> > low-power management and access control. These blocks are defined as ch=
ild
> > nodes within the Clock Pulse Generator (CPG) address space in the devic=
e
> > tree. Implement support for creating regmaps for these SYSC blocks.
> >
> > Register the regmap using of_syscon_register_regmap() against the CPG
> > device node so that consumers can access SYSC registers via the existin=
g
> > syscon phandle.
> >
> > Add a sysc_init() callback to the CPG/MSSR core to allow SoC-specific
> > initialization of the SYSC regmap.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Made use of for_each_child_of_node_scoped
> > - Moved sysc_init() to the end of the probe function
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
>
> > +static bool rzt2h_writeable_readable_sysc0(struct device *dev, unsigne=
d int reg)
> > +{
> > +       switch (reg) {
> > +       case 0x0000 ... 0x0008:
> > +       case 0x1000 ... 0x1164:
> > +       case 0x2000 ... 0x2024:
> > +       case 0x2030 ... 0x2054:
> > +       case 0x2060:
> > +       case 0x3000 ... 0x300C:
> > +       case 0x3100 ... 0x310C:
> > +       case 0x4100:
> > +       case 0x4200:
> > +               return true;
> > +
> > +       default:
> > +               return false;
> > +       }
> > +}
> > +
> > +static bool rzt2h_writeable_readable_sysc1(struct device *dev, unsigne=
d int reg)
> > +{
> > +       switch (reg) {
> > +       case 0x000C:
> > +       case 0x0034 ... 0x0038:
> > +       case 0x0048 ... 0x007C:
> > +       case 0x0100 ... 0x017C:
> > +       case 0x0200 ... 0x027C:
> > +       case 0x0308 ... 0x030C:
> > +       case 0x0320 ... 0x037C:
> > +       case 0x0480 ... 0x0484:
> > +       case 0x0580 ... 0x0584:
> > +       case 0x0680 ... 0x0684:
> > +       case 0x0780 ... 0x0784:
> > +       case 0x0880:
> > +       case 0x0980 ... 0x098C:
> > +       case 0x1100 ... 0x1118:
> > +       case 0x1200 ... 0x1204:
> > +       case 0x1400 ... 0x1484:
> > +       case 0x1500 ... 0x1584:
> > +       case 0x1600 ... 0x1680:
> > +       case 0x1700 ... 0x1780:
> > +       case 0x1800 ... 0x1884:
> > +       case 0x1900 ... 0x1984:
> > +       case 0x1A00 ... 0x1A84:
> > +       case 0x1B00 ... 0x1B8C:
> > +       case 0x1C00 ... 0x1C8C:
> > +       case 0x1D00 ... 0x1D8C:
> > +       case 0x3000:
> > +       case 0x3010:
> > +       case 0x3020:
> > +       case 0x3030:
> > +       case 0x4000:
> > +       case 0x5008 ... 0x500C:
> > +       case 0x5020 ... 0x503C:
> > +       case 0x5100 ... 0x5114:
> > +       case 0x6000:
> > +               return true;
> > +
> > +       default:
> > +               return false;
> > +       }
> > +}
>
> This exposes a lot of dangerous registers.  Aren't they also exported
> to userspace through drivers/base/regmap/regmap-debugfs.c?
>
Yes they are exported to userspace. I'll drop it

> > --- a/drivers/clk/renesas/renesas-cpg-mssr.h
> > +++ b/drivers/clk/renesas/renesas-cpg-mssr.h
> > @@ -178,6 +178,7 @@ struct cpg_mssr_info {
> >
> >         /* Callbacks */
> >         int (*init)(struct device *dev);
> > +       int (*sysc_init)(struct device *dev);
>
> I would rather call it "late_init" or "post_init", as it might become
> useful for other purposes, too.
>
Ok, I will rename this to post_init.

Cheers,
Prabhakar

> >         struct clk *(*cpg_clk_register)(struct device *dev,
> >                                         const struct cpg_core_clk *core=
,
> >                                         const struct cpg_mssr_info *inf=
o,
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

