Return-Path: <linux-renesas-soc+bounces-31451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCIFDNVK52lW6QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 12:00:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BE14393EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 12:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E0313026A90
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 09:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C5E3B0ACC;
	Tue, 21 Apr 2026 09:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwPvT1z1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CDE3AF67F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 09:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776765377; cv=pass; b=KWKkOVDIoWg2fuMU8GGduy4SZ88lOjA5oHXA1trzsJBOG2msgu41OuLTBC529TMBNnN2O+rqsGFGoc03b8/M66ngRUGU160qPmmOYZfhp6mY+J7g+rHmkbBOquWoxN2UI0c8YuHaok0to8HLuer7xdHq21CYsphb3Q1cxzOfayE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776765377; c=relaxed/simple;
	bh=l4DrSR2BZIgYH4d/QUNDql7H9ZjohL0n1yHLRqh+zKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqYaHiuZVKSXBMoQxPan9DGUnkIEhM1cTfAA+jbg7Ylo8XEgVO/c14jq75CRmTkmSSz9B5s5xgWq2ls+xyhwN4gwsUanqVxy1RkayPAQNY7B+ftdUVRrx+3esh9FEy4hFh00GuMa79XMg/zTLZY2/BOF34s77mWFvipR4iX4Sg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwPvT1z1; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so3745435f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 02:56:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776765374; cv=none;
        d=google.com; s=arc-20240605;
        b=Wg269YU8wLpMc36152rtz5rT166+slHJpl6uqfPjRYazqEQh9iG/JABUi/+rfkUmwk
         6O1ySHcZ0KftuYCM4mstVhyai25Xm6xbqtak9gZbaH2BAjAbKP+rBN5jOy5Wt5n7N721
         lvCJa2zsNucDYwp1SlZ/e3gQsD34gZ/EHtEWCpbBQKgU83Xv9ySsFJC3lmEOHJUcxFOJ
         T9PSVBqzeIDuYOT9WPSGgIlwikVDZ6BRCxOu4m/Zcn4PSqZEPDFrK49X/+f3K4EBZRM/
         9CM9hVgsSZvxwEPBT+VZZ/oIJ06UfwtfuznurRAKPOKS5TesS4CMmausOm0EzoNtUuT/
         L/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fgT8kupPOa4t9aiolsgihVHR1feSg5akKNJAdNp7y9I=;
        fh=X3LemzF2gkm4yfk1c95i4eBG/dV5MSXGm6qSOZph3tU=;
        b=KcZHyC/SA6658hN5F+aFdV05dB1mCBh/HJktBKGlfzM7GGyLlB0TxLTab6QyDdwR6T
         gXQ1VGEFlR2md4OEZdew2ibGwriij5jek3a9sqfi3rWYM0uVuhcZ84wWA4zJNBGMEaV8
         hoUpBbB9esLsAvUcqYPmTbSNOD25mcT8Ui9OzLE4fyiGRW4WvrgKOrnACXjtHdT+YTFD
         0bqHREq8YoK9jk+d6LAlxWNhRg8PhMP+3XnQ/KK/NLfEhWzn44drMDqd+3/bzWp++nz4
         R25k/aD+ph43Nw1hdZyL87Z4LUeEdgGSUPCQ7oJ2W9xYNqlowHMnPj7Og+ZOlBRTPIDR
         LO3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776765374; x=1777370174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgT8kupPOa4t9aiolsgihVHR1feSg5akKNJAdNp7y9I=;
        b=cwPvT1z14F2OarczFIEf4OqhgNp82scAsR40/zLKQWW6prJBt8/yulk6qnZD66iIkr
         l6YlhSkFXZhIGNbC0D4Eb/SQ8iuLrmBk8nAW8AHlUpkHCRF0aCstrj3AgPKzxpL4QUl0
         w9orggW9dVrLC5i5sld7L7b33/htBJDRTTzL86hNqjYn8oCQIY4weQh3Eo4/EriA36D9
         RNn5A92qgUgpUu1ytLB0UlQS1rRS/54IFsFua0v2LrqIfYs4zJLFKb/nWvyl2wnx0LY6
         iwq47wrNstLQOrAw2M8Po5Un7w59FCMzUBo4AT22HnGOM49+Gl7QPBz9MdiYDHHzfIjZ
         ZYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776765374; x=1777370174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fgT8kupPOa4t9aiolsgihVHR1feSg5akKNJAdNp7y9I=;
        b=jHLLHn3aXVmWOqG+nfSpaamP1dU2QrTcan9DjIj1jzNYlbGMp1Dy0hkXBdv4aKVulm
         v0FPXdGgs42qt1bSu9FzuSNKy1aeoNtlqRDaIyTAfjxtxas7XS1DNeZ3jAewe4xdNUtE
         GWyyYZs+c/J1uz87injFDRNYIan1lILCrD7FDWb/NZ/5979nJyX/u9vU6TV9pRwKBe/B
         eU5kCiKTYdjs0Q/64WB+NG8876FhfG1iI1Z7FFelsCROgwe8Gx/4PZNBJiIOR5JZdGj3
         +LrtRO0cnL0sBcplJ98/WPjAC88QekIuAYu3wziz2dVDHQlLm3iMOPTSLiaatjG9DK70
         cb7w==
X-Forwarded-Encrypted: i=1; AFNElJ+zzstUoqihSGk0rN3j2fbB7jrdTsVCQy0s2/z1+Q+xY6hkWyeZYrgM5KX8SwxWxjOUXKd0dg6mgGwcLL+ISmc1DA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmSfGPtoI+j7AiDqzT8nGSEWm8auW/SsXCukboVma6EtRrY1n8
	j2R8TXRIQu9r2RlKaOiAPM2ef9Rzm05hnw6IEfqvB/xw1DYTX3zdzIlGpcKuBiJ0B99xPtTgSWM
	NTYNmZlUDWOS3Q9jafUUiOH9MfJe7WeU=
X-Gm-Gg: AeBDieuOOXXLXidnbK9UyCiSGzOdxQzRJxZDczbahGAkp1IF5aDDkpuDD5BXYWAz/1t
	8/WBtxXKpYeNNRogsndEjkbSx0j09yWelGJfL8qLOxlsBKJYrs608EQJYlb22DtI3GeQ1hk5Yh7
	6KiV7h9fqhkl7ePWsdMDQ6k8Di2Akaj9t94rmOf/JZUfzX4bVfdQS9ZSsicN0Qq2ru/vxAv3WSB
	1Vomt+sltkLVByYEKXZrlXgnn2uetmpLclxZ7OElJCzeRHC1WEqSPIF5xQo+XfryGHLaUZRNzwN
	M+z2F40K6qqakDmyFPYTIfvAqOiZ4BFuDD/QJmaSZvd7i4VJe+KUXrLsYR1v409tZ26dVZxK9tx
	uINpMt/hP/WKe+t4=
X-Received: by 2002:a5d:64e4:0:b0:43c:f7e5:817a with SMTP id
 ffacd0b85a97d-43fe3dd4b72mr26892067f8f.19.1776765373943; Tue, 21 Apr 2026
 02:56:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260318235907.831556-8-laurent.pinchart+renesas@ideasonboard.com>
 <CA+V-a8t481xuwava0nb7uY9CUPqFWZ_8EP0xrK3BgumP7HDcLg@mail.gmail.com>
 <20260416211139.GC1824072@killaraus.ideasonboard.com> <20260420235742.GA2315844@killaraus.ideasonboard.com>
In-Reply-To: <20260420235742.GA2315844@killaraus.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 21 Apr 2026 10:55:47 +0100
X-Gm-Features: AQROBzBoNRQ5n8fSx0jYvJE8eFj8QDo4AVBQM3KMDxf3renBbaMZmEtBBxZLrkA
Message-ID: <CA+V-a8sfM6ujv5b1+CnkSM9Lnsax6-qG4HZTc+qy0PaDcZnGLA@mail.gmail.com>
Subject: Re: [PATCH v4 07/13] media: renesas: vsp1: brx: Fix format propagation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31451-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RSPAMD_URIBL_FAIL(0.00)[kms-test-plane-position.py:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 15BE14393EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Tue, Apr 21, 2026 at 12:57=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Apr 17, 2026 at 12:11:41AM +0300, Laurent Pinchart wrote:
> > On Thu, Apr 16, 2026 at 06:49:14PM +0100, Lad, Prabhakar wrote:
> > > On Wed, Mar 18, 2026 at 11:59=E2=80=AFPM Laurent Pinchart wrote:
> > > >
> > > > The format width and height is never propagated to the BRX source p=
ad,
> > > > leaving its initial configuration invalid. Propagate the whole form=
at
> > > > from the first sink pad to the source pad instead of only propagati=
ng
> > > > the media bus code. This fixes compliance with the subdev format
> > > > propagation rules.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonbo=
ard.com>
> > > > Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > > Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> > > > ---
> > > >  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++++++++--
> > > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drive=
rs/media/platform/renesas/vsp1/vsp1_brx.c
> > > > index dd651cef93e4..911359faa600 100644
> > > > --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > > > @@ -156,14 +156,20 @@ static int brx_set_format(struct v4l2_subdev =
*subdev,
> > > >                 compose->height =3D format->height;
> > > >         }
> > > >
> > > > -       /* Propagate the format code to all pads. */
> > > > +       /*
> > > > +        * Propagate the format code to all pads, and the whole for=
mat to the
> > > > +        * source pad.
> > > > +        */
> > > >         if (fmt->pad =3D=3D BRX_PAD_SINK(0)) {
> > > >                 unsigned int i;
> > > >
> > > > -               for (i =3D 0; i <=3D brx->entity.source_pad; ++i) {
> > > > +               for (i =3D 0; i < brx->entity.source_pad; ++i) {
> > > >                         format =3D v4l2_subdev_state_get_format(sta=
te, i);
> > > >                         format->code =3D fmt->format.code;
> > > >                 }
> > > > +
> > > > +               format =3D v4l2_subdev_state_get_format(state, i);
> > > > +               *format =3D fmt->format;
> > >
> > > When running kms-test-plane-position.py (from [0]) on RZ/V2H EVK, Im
> > > getting vblank timeouts as seen below:
> >
> > Oops :-/
> >
> > I'm run the KMS tests on a R-Car board when I submitted the series. I'l=
l
> > test again tomorrow.
>
> I have been able to reproduce an issue with the same test script. It
> doesn't result in a vblank wait timeout, but in display output
> corruption. I'll investigate and fix it, and hopefully the fix will also
> address your issue.
>
Thank you.

Cheers,
Prabhakar

