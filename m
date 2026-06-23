Return-Path: <linux-renesas-soc+bounces-34368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QKXmNfdDOmoU5AcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 10:29:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4983C6B5486
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 10:29:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NX2jRg9a;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FBF13017FB0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 08:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC523CB8FF;
	Tue, 23 Jun 2026 08:29:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5508E3A987B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 08:29:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782203380; cv=pass; b=jQ2h2bYZOOrxBVIaJz+k35wOxYAJrb4zn2XrosTw4NtQkd2OrbBxFvu5LWl/8hWcqRXTfM9zyoutKw2loZs+IsAe5f4O2o/183HXACBZedSJW/6Dra9cWsfYi/LgsnPdjq+y3e8LMHcBHJ0bGRYrUace7nWMI0fBpubKW43eV44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782203380; c=relaxed/simple;
	bh=C+rVe3rgMlyulc0E1pMbdDXcZKdISk0r3L7hAmE6two=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzuSTeL/o8Io/2VSHFm5+onxFX145Izw0gRIoRqMsDA/INZqf6p9o3hpml+wGXD3v2shpmVDvp245FCoCHRnegWyE9sdOvMaoHiLbSIKBCr538ea7lElJNjSsmDLC5LaG85LbfsOMzUGqLYffW2IskvZclvBRyhCCLWjj3B2fro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NX2jRg9a; arc=pass smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so4198352f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 01:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782203378; cv=none;
        d=google.com; s=arc-20240605;
        b=SjwFFZsjuZMAJPXIVdFk1043w66GSSIeM3y2/XIkivgtk5wo/oVEJdjSUpZYsXK7cv
         xYXdrAHeN/63AQqeFWV+xwixkCVXy6EtGO3ZGqDBiE3jkPFYsQwcFNS2qncHx5jrodI8
         0f5GgT+bj0aQOlkIMhKadFRxHwPmMkgVwKMBFYK8tMAyept6G5uCQ6Qr7FGedL0LoM0B
         +PByMM0KIEcJgo0FT+BuVsSpMq51JgiS9k/ZatMZyo8hMJrysiePclDwidHTg1Y3yZDy
         0FvXF10+HuReKf1znPPvmFR5NwkxEKkt00aB8vQP6t/VemW9Ud4yrD3XhmWTCewc4Zc6
         RgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yrBfCI0KWhncSe2793Dm3kx6USZ2APOlz/hUKpRJG0I=;
        fh=RQhLcSTc0rNpbVF4mvVq5zFrIOFBYgEJ+n0PJEbeEI4=;
        b=jT5QvpeLNr0rh6q6G+8ZkHLvgGjaIHu9DSur/5dxmfgpUP+i6+d2dUJr38kWelaJe4
         F/V/FFzYBzX2BbJARyNB3Q+u3f+Nnj3nIEPX6cbZN8asMn2ffIKFFDHRAu2TIj62Jyvb
         RIk4OKpOiaaN7o3La0wsKCGkqjgyxX9Zj6HJtspBxcymE+p0BWU3Gd6YO/gvyFXXTBeN
         d5Lm+TxcmaCA3rfY8/BDdrRjHSxRNJkUjgxScmgVaiLxwhoPAKsQfp0qho8KZwPRVeHi
         xszQlYsGScVancxwR5PznqWZ2TKAZ5iMpzbWwDnh4SGSxeH8M9MOiDMIXmDp4VW8wCNm
         Ud6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782203378; x=1782808178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrBfCI0KWhncSe2793Dm3kx6USZ2APOlz/hUKpRJG0I=;
        b=NX2jRg9axX9TBTAw0TFksFRyFltIIlBDUJ/R1TUVoX4uRuUzeu9Q4/BLyoI/qTMdcN
         vwox3hajpR9s+XkRsvFh+x41iBOVOxNaDvXN56lACGbLR5+Lu/9KV/B6HZEyDZ0PgfZE
         aP7UuTnnJwlRGs2r7bhdNvHreBlUnQcko7ci7nCSWhQsxmN9PJI6IQrN3/7GVeBwF1Rw
         Nfj0kkqGsoOlwFPrnMM5e7i0bVFcXpn3uOAtT/GdZmV3bjlx3D8xyhbkZwryj9vTNcnL
         HSVRmMHrRDKuojRluNSssAKJXjqXbPDmQuqzk82BYSqKZRrae4INgRDCxYVDvtfSxdap
         wJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782203378; x=1782808178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrBfCI0KWhncSe2793Dm3kx6USZ2APOlz/hUKpRJG0I=;
        b=Y963pXGSu5kFDo+LzIEZAH22oco6E/nz9Asau78dz7PcyRmofcdvrc6D4T2nNbYd0P
         KU6bNaSTGYorC9u31kF6ttO9NvUIADUBtvPMjHrsfiuq7oIhP2ijqh+cx818wp3OIxdx
         lNN7uAsnqP8WrTwVOl5On3XrsG3yajRRmHyrrC0imttFTHWzBuIH9BeBgE1FveBMm/vm
         0LBitRuYBQ5ctiodnEmf1EV9CcmkbTRhASVjk9jksI/M6kWCPlD55KBj9mDAzZikyYvV
         uqlJ6B2BDXuc6HbuOmxmG3ftVhRuOURzvpiDeWXjQb9aM26WBPlFpJUt/kHrh0GXf+as
         c5dg==
X-Forwarded-Encrypted: i=1; AHgh+RqSzfUmfkcjj7T+pqdYbC23vfZ2xheCEuBcVZ/3iL7s66PuQBxQ9f/ptmjZO7YBq2gfZ4Mrfumx0fUGTRcpvZRG1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw50zqm/c0i87DH7Lhq8Zm/jxFu/OoqQ38ZWS1AEsiN1Q1oBEHc
	vKJkG0t2gog84dyfuXoEwlD2g3ioDDOtZAwtlGqV+XOj897FG4xRxyzv6fNN8A0uZ7mPCBCbwTl
	tErDZ+raMR00ZT7uLVr88pjQZjCZIdu4=
X-Gm-Gg: AfdE7cmcmaVMgt+V2huaMiFyApcPpLfiDmGb8jY0SlHpDxScGD7x99o3hKCsnrY6iXx
	HOkaDQStidwD20zrfxy4ccDD2hmwLTZ8ZQAqja2EmVW2j5Uqcs4nkYSNLmKTwXYsFNvRCBSEaNs
	LSCGVTmxEwItkC/m2JsGFH3pi4nJNxrmNQ+NPFpws0B8n04ENTSoX1OYfdwKAP+Bz/pCM2XpgtF
	R70FbLj1qD/AmWXZf5p5hjchu7c94V+OuXwTKe94AAdU2Y1AxLgsjiKfmFtdRurpjZyqNOt00wl
	qUdSt/xRMPL8b1WDhRR4iU1i2eibtMLo0m4fylGEqWaWeqeYdBdlYJQvx0g=
X-Received: by 2002:a05:6000:4817:b0:464:c5be:37f4 with SMTP id
 ffacd0b85a97d-46add279a05mr2659263f8f.29.1782203377562; Tue, 23 Jun 2026
 01:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260602195019.1798126-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <50a908557bb3ce5f14b67396d1e73e70289a583a.camel@pengutronix.de>
 <CA+V-a8uGho2RMhreDgieOOZTggUALoF0bGyjdEEDvyL_75sAyw@mail.gmail.com>
 <fuefvecgjdqbnbvpvam4gmewmpmhofllyq2ootwi6cjqhnyoys@edjzqlh6fjw4>
 <CA+V-a8sRxoR96TRM2V3cFXS5NPiQUVrUJCWwkh7o10cGYPU9_w@mail.gmail.com> <txpkke2xogecipyetascqajgaxamd3ualcuhsibxf75llzcym5@xgcn7efcbmp4>
In-Reply-To: <txpkke2xogecipyetascqajgaxamd3ualcuhsibxf75llzcym5@xgcn7efcbmp4>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 23 Jun 2026 09:29:11 +0100
X-Gm-Features: AVVi8Ceuc3mOlVkEu2V82Unm6uncN0y20DQ8eINHTMm2bh1FOOcG0M9fbuSJgo0
Message-ID: <CA+V-a8tiRc0J74e73qLyLgQOey1GLNoa5VbRgpEN9ZCy7hH-4w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] PCI: rzg3s-host: Use shared reset controls for
 power domain resets
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:p.zabel@pengutronix.de,m:claudiu.beznea.uj@bp.renesas.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34368-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[pengutronix.de,bp.renesas.com,kernel.org,google.com,glider.be,gmail.com,vger.kernel.org,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4983C6B5486

Hi Manivanna,


On Tue, Jun 23, 2026 at 7:04=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Mon, Jun 22, 2026 at 03:53:57PM +0100, Lad, Prabhakar wrote:
> > Hi Manivannan,
> >
> > On Mon, Jun 22, 2026 at 3:30=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > On Fri, Jun 05, 2026 at 12:54:46PM +0100, Lad, Prabhakar wrote:
> > > > Hi Philipp,
> > > >
> > > > Thank you for the review.
> > > >
> > > > On Wed, Jun 3, 2026 at 9:16=E2=80=AFAM Philipp Zabel <p.zabel@pengu=
tronix.de> wrote:
> > > > >
> > > > > On Di, 2026-06-02 at 20:50 +0100, Prabhakar wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Switch to shared reset controls for PCIe power resets to prepar=
e for
> > > > > > RZ/V2H(P) support. On this platform, multiple PCIe controllers =
share
> > > > > > the same reset line, requiring shared ownership of the reset co=
ntrol.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renes=
as.com>
> > > > > > Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > > > Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > > > ---
> > > > > > v3->v4:
> > > > > > - Added RB/TB tags.
> > > > > >
> > > > > > v2->v3:
> > > > > > - No change.
> > > > > >
> > > > > > v1->v2:
> > > > > > - Updated commit message.
> > > > > > ---
> > > > > >  drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
> > > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers=
/pci/controller/pcie-rzg3s-host.c
> > > > > > index d86e7516dcc2..a5192e4b58df 100644
> > > > > > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > > > > > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > > > > > @@ -1276,9 +1276,9 @@ static int rzg3s_pcie_resets_prepare_and_=
get(struct rzg3s_pcie_host *host)
> > > > > >       for (i =3D 0; i < data->num_cfg_resets; i++)
> > > > > >               host->cfg_resets[i].id =3D data->cfg_resets[i];
> > > > > >
> > > > > > -     ret =3D devm_reset_control_bulk_get_exclusive(host->dev,
> > > > > > -                                                 data->num_pow=
er_resets,
> > > > > > -                                                 host->power_r=
esets);
> > > > > > +     ret =3D devm_reset_control_bulk_get_shared(host->dev,
> > > > > > +                                              data->num_power_=
resets,
> > > > > > +                                              host->power_rese=
ts);
> > > > > >       if (ret)
> > > > > >               return ret;
> > > > > >
> > > > >
> > > > > I have a few questions about this.
> > > > >
> > > > > Can you move rzg3s_pcie_resets_prepare_and_get() and
> > > > > rzg3s_pcie_power_resets_deassert() up before setting
> > > > > RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B in
> > > > > rzg3s_pcie_probe() without ill effect?
> > > > >
> > > > > Can you move rzg3s_pcie_power_resets_deassert() up before setting
> > > > > RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B
> > > > > rzg3s_pcie_resume_noirq()?
> > > > >
> > > > > Those would have the same effect as the reset already being deass=
erted
> > > > > by the other controller.
> > > > >
> > > > Yes to both. I have reordered the sequences as suggested, and it wo=
rks
> > > > perfectly without any ill effects.
> > > >
> > >
> > > Are you going to respin the patches incorporating the review comments=
?
> > >
> > If I have not mistaken, no code changes were requested; it was just
> > that Philipp wanted to ensure the shared reset worked correctly after
> > shuffling the code around.
> >
>
> Ah, I was mistaken.
>
> > I can respin the series if it fails to apply on top of pci/next.
> >
>
> Sure. Please respin once v7.2-rc1 is released.
>
Sure, will do.


Cheers,
Prabhakar

