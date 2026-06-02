Return-Path: <linux-renesas-soc+bounces-33448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IcIbHgwyH2pNigAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:42:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C566317AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:42:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cGV2txhM;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 734113002538
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 19:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CC0346E70;
	Tue,  2 Jun 2026 19:41:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62273161BE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 19:41:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429318; cv=pass; b=axLZ9Rg/JXfCLx3vvCqhG1dAmXYG9Z2bmtGlI6OdNfR3qvMzOASuxBZ3onIeAyZmDQhcG8ay2mwpd/FXY3izX//TkS/9m/nb2vCfpVjO9qNH5f6vNAhV3f/AT6+Xsjn9MZl/Xy0Qur7QjCNuyRSgYojMX0GL7Ii2qWsJuFEt7HM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429318; c=relaxed/simple;
	bh=EBlHZlU/yQb6bBWjzw7fMGP8qSSTAGTVxYB6n+3g18g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5rbRYMfbQU8VXMYo8h5gmoBuZo/o1koonEw9VodQ175/EguTtNHP47bc7cdNQ7yHhMzvKNNPJXRZOFIvNwvHM4aWoUvsiOmlTpY5zMPzxy1kg+n18mjM5oFBf57nJdDCNXmxRX361pXmpPksVjpDUz/Vw7qtl67NKIvbB6HRVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGV2txhM; arc=pass smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1683626f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 12:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780429315; cv=none;
        d=google.com; s=arc-20240605;
        b=LkkzK1eSNNGDtF/Sj08e7Tu8sR+K3HfObTAhYOZYmDwJGFgyZ3iiajXAWAHzajy97Z
         vrU+w1IC7bsJ1yLpMNmQrU/rPhVnZ0Ou4kvevSwMs4D2fkSnopWZAZyO0HoZEeMZE+lw
         bPvuQ74GSN+Jesv16llQxERFmDTUsF8oZMIpg79ftOb1gyreTqDcJblLdJ5qU6VATpHY
         pA5apXHVj9Ti/nJGJRLIPHt4Xb6LH+IfL5qN/GVFoU7Kq0PbFjgzLNEWISrAiVnJa5IG
         7nISXBI+vymjDJ4yGF9DOEc+mtOPRYbXIX2eELWAoorr16QJyAnkG9WL67bipvlnzcZd
         dDqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sEMh5W15s3ZL+Zo+DJX6OYmqs9feRMkS6Ofgti1mA8U=;
        fh=wO4Z5EFAqv9h6S+7Ac2WSeGv1bnmuII0tX1Zkwj3MTM=;
        b=Ekmzs+fcAQEuMg17Bj2GnaCF1hjnJdWx4ohfPPVSBPx0SIJbYkYK8P1UTWfs7tQ/JU
         ST5HqlTd3dpaXGQY98gRugOSI50eA9z6eXibBTlCD6RMjog0HlKSDxe6oGSnox22zIbr
         6tZWZ5T7Ih0o9gByBNIrJwYDs6iYiHcbMx6lGwCyu3fRR0IL8e+dZEp2nkyj6ebzTWCZ
         Ih12Gq58xpGCmfapJkhrEdDg9+9n/JaL5RS0XbEMUQpFszSHktBP/cQuXzNkNczddKz6
         uDf4OjPgrYap56BASd0gfw2DGtw2fETkwycEw8DaYfd9aG1dWJ7UVaKRqpLH+JjU2nUl
         zV9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780429315; x=1781034115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEMh5W15s3ZL+Zo+DJX6OYmqs9feRMkS6Ofgti1mA8U=;
        b=cGV2txhMoLt57fIdn+/Nh0eqKujDeRLSChuzJd/mUtIXSsba3ameMWIW08BcR6nRIy
         1nj7HsPcP+sDSkgZFTMm/4xeKqW9Ky9MW9gkEHCHIlNthG2dUcB/PDxCBWM8WgOSb+Fb
         6c1eFowSDblf4cfx4pEK+xE7tmByy3wGGYVdGfR/gyZsLXt8lMY6yG/Hy7UPEM134Xdc
         gp4F3X0/+50gG99RrgkReoHSXVoaAz1LGhMXeQY5gv2ZLovTlUNCt5sK0wcbUVdZOU6W
         5qMqVDnpzvPY+M9zxQvZXFAI8ArwRbaKoD5HfhNCFXTRaE396atPTFc1UrQbQQFnRB1Q
         lihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780429315; x=1781034115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEMh5W15s3ZL+Zo+DJX6OYmqs9feRMkS6Ofgti1mA8U=;
        b=lpfx6wTX+mx5RjQ4kaPsyfb9cne6EaPaQH9A09UZBBXJ2EtWis/ggDn6GrASYCYNgX
         /csHGVFzJmXLxXHxR8Q7jGSe5ircos9d/gsIFjNa25MR0A0uBOEmqF2TlYcIF5OOhYyz
         iVAqHQy7pYi69fF0HecZg6PA9/gTzbjm0oZkw/myOcqlV3u/CNGctUJUNA/q+10aPgIF
         URCC0AtOAy41I+bgZLXM/0IJ2IL3Tuk/2Fel6qDOKXAZuZCVKmysGBiispZynTJ2UtJB
         Kraekak9FFjoHT0Yd6YafGTEaZTHZIbzGoTVCikNq2f5klgVcD5UEr1UmxiiZbyRaI39
         r5qQ==
X-Forwarded-Encrypted: i=1; AFNElJ80Jd9zpd/ZFel/arLniH+IdVc59Yxc97q0Ph6/0no8/g5+lx1H/bbBD1JUwbt39B2X23MZV3Vw+XaVlPIsQRjjcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypPc8a5/6X0UWAcP4GcQnzjcfmHdn8sELF8YX7XvPPRLlVKW9V
	iDqzjtWpBngm1EmBFsHgW3g7hz1v4MvHGg09feNfGnEXnITa/mp86Lg981VV46hgtLMP30WUj3X
	pyepUZt6/gsCMnRL4T8Nr3y1Spm6z1A8=
X-Gm-Gg: Acq92OH9Q+DiaraE7zpW6oqkIt73MxC3leusxow/Rv2XftoqNyTO1L1a2OG6HpKkkwc
	pw0upwYt6CB5Vae+2rLFEeo86GNLXGuARRqVaxRY6kCL3n+I+4cvn4QuHdOerbRIV1C6gE1ZN07
	IgKzJeHCQ8q5E0PxrI+iNtVQcg1Y7ntnZm3C7WXb1qG4yDbmUqNAzCwCMnzulwZh1GcI1RCTcEM
	cwB6encBBdWeyDwnXgqodQM7CKRQwWsLy7phkBVWm0i5Xojz5vxBrGwukqgUk1uWSxsR4udU37R
	aRqSnfHZI0rkWFKpwtnjlDFAloNO310WKLnf4krU5QsnqhPFqd+4EgUznpVUVfQgvEFogBq44D9
	DumTQ+UTiLMYdlphbroNmAzBqVACTm6PGFQY=
X-Received: by 2002:adf:e508:0:b0:45f:1bd:a04d with SMTP id
 ffacd0b85a97d-4601f4fac09mr882189f8f.7.1780429315314; Tue, 02 Jun 2026
 12:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260520164823.436992-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <86e80877-b860-4b93-a5ae-a416840eb393@tuxon.dev>
In-Reply-To: <86e80877-b860-4b93-a5ae-a416840eb393@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Jun 2026 20:41:28 +0100
X-Gm-Features: AVHnY4LH3tVnbhX2kihO8dGiFPGS7IjVgtm6CenunWIAP8asGwsAHQWQnCcdEGs
Message-ID: <CA+V-a8vR0tOXdMZcA4fi+VykwHokHQqm-s97UNKMbPAaq-3ctg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@tuxon.dev,m:mani@kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33448-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,bp.renesas.com,google.com,pengutronix.de,glider.be,gmail.com,vger.kernel.org,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,renesas.com:email,tuxon.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68C566317AF

Hi Claudiu,

Thank you for the review.

On Tue, Jun 2, 2026 at 9:00=E2=80=AFAM Claudiu Beznea <claudiu.beznea@tuxon=
.dev> wrote:
>
> Hi, Prabhakar,
>
> On 5/20/26 19:48, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for the RZ/V2H(P) SoC PCIe controllers to the rzg3s-host
> > driver.
> >
> > The RZ/V2H(P) SoC features two independent PCIe controllers that share
> > four physical lanes. The hardware supports two configuration modes:
> > single x4 mode where the first controller uses all four lanes, or dual
> > x2 mode where both controllers use two lanes each.
> >
> > Introduce a setup_lanes() function pointer to configure the PCIe lanes
> > based on the hardware instance. Implement rzv2h_pcie_setup_lanes() to
> > detect the configuration at boot time and program the lane mode via the
> > system controller.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Parsed controller-id from the "renesas,sysc" property instead of
> >    using linux,pci-domain.
> >
> > v1->v2:
> > - Updated commit message.
> > - Added locks to protect shared lane configuration state and
> >    prevent concurrent access issues during probe.
> > - Added cleanup action to release lanes on driver removal.
> > - Reconfigured RZG3S_SYSC_FUNC_ID_LINK_MASTER in resume path.
> > - Renamed num_channels to num_pcie_controllers for clarity.
> > ---
> >   drivers/pci/controller/pcie-rzg3s-host.c | 180 ++++++++++++++++++++++=
+
> >   1 file changed, 180 insertions(+)
> >
> > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/con=
troller/pcie-rzg3s-host.c
> > index edb49af7429a..15879b2c0bd2 100644
>
> [ ...]
>
> > +static int rzv2h_pcie_setup_lanes(struct rzg3s_pcie_host *host)
> > +{
> > +     struct device_node *np =3D host->dev->of_node;
> > +     u32 num_lanes;
> > +     int ret;
> > +
> > +     ret =3D of_property_read_u32(np, "num-lanes", &num_lanes);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /*
> > +      * RZ/V2H(P) supports up to 4 lanes, but only in single x4 mode
> > +      * for the first controller. Dual x2 mode is supported with 2
> > +      * lanes for both controllers.
> > +      */
> > +     if (num_lanes !=3D 4 && num_lanes !=3D 2)
> > +             return -EINVAL;
> > +
> > +     if (host->controller_id =3D=3D RZG3S_PCIE_CONTROLLER_ID_1 && num_=
lanes > 2)
> > +             return -EINVAL;
> > +
> > +     guard(spinlock)(&rzv2h_lane_lock);
> > +     if (rzv2h_num_total_lanes + num_lanes > RZV2H_PCIE_MAX_LANES)
> > +             return -EINVAL;
> > +
> > +     ret =3D rzg3s_sysc_config_func(host->sysc, RZG3S_SYSC_FUNC_ID_LIN=
K_MASTER,
> > +                                  num_lanes =3D=3D 2 ?
> > +                                  RZG3S_SYSC_LINK_MODE_DUAL_X2 :
> > +                                  RZG3S_SYSC_LINK_MODE_SINGLE_X4);
> > +     if (!ret) {
>
> I personally would prefer:
>
>         if (ret)
>                 return ret;
>
Sure, I'll update it as above and send a new version.

Cheers,
Prabhakar

