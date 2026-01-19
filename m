Return-Path: <linux-renesas-soc+bounces-27087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A69D3B9F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 22:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDB563050186
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 21:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B0A2F9C2C;
	Mon, 19 Jan 2026 21:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="e8U1dkI6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71A22F99AE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 21:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768857869; cv=pass; b=qIWkltwO76BqTjJYXDSjpSbCY4rdyko8jAAas1UYY2fEMz1DG3Sh/SKn5pl9BXcxgJ1dbivjzift40JXdfZjE9xLoulDd47bxKMPu3Tdyx+vqdxRK+cBwoKfeRhvpve1HU6v3RAVPKBJ8j10ARjeOc1OyjY3EWqCmpvdCncjnBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768857869; c=relaxed/simple;
	bh=P564zifxGq7gpIAXiYMGNHPdZBZ6qjwcGkLD/d5fbQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Js2E4THjBN9iwRyrdxpf6xSM/mTgOMjAlTraC3puBLHQRcPonehBkbNplfn7oc9HVyHSV1Dfg32VVEdB9ICqrS3SFEfwgfZmVE4OKbcWxpzwgBi4NzZe1XuxF+uc8KmD+Hd6U+qd1NxDCF4ADBwVJR4EfBeCGtI2CNhbvwXd+ZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=e8U1dkI6; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a09d981507so35621165ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 13:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768857867; cv=none;
        d=google.com; s=arc-20240605;
        b=BVIl3rWMyspPuIjXAGqzxvM2j6TYhT6I7KKbmK2bptG3SrJaAoeWWTVgz6heB+C5Ma
         ZwvfqlmoT1GEp7J4uAtkH65HahQLHgA2QpUY10QHgnxMwB9vvxBfaAP5pzzEmFhIuu/q
         h8+qbpq51pGXbGU1VkvEQIhiRHuKSWpuEZFAWbQD+3kgB7Akok75SzvNWqI2cEw+DDXd
         TWvwKgLO22WUe8hryEsYFw9okoqBVlgKzLroQHV2DD1K6mbMB1YKUHipe4/SUAH+OASI
         /AvwsrlahJMWxF7+Ds8fhsSpGhb3cmgE7/RT9ITF+6ab8scH2/PpJsDYWTbMywLbHH6u
         Fohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        fh=PFpnNx2I9LhLsEHeQOftNCdHYNFPN2KyNGXyB3WNFxU=;
        b=hU3d3o0dRrHaKA65TAL71Vp52WeoKwO2CjPTiN9nPth2SvvD/i/kImh3il0xT/NSyv
         pX7Ep0e8048iyaTwhSjy9g+8yHbvusR3LdmYcQW0V17M5Vq6nK9Q4JsU4YLwg5Uy4tNF
         xM2s35cN1H8nX/dLI6gx1IV1zt9Dfe20p269ELc0e5sI/2K8I60wStwwUD1xCz0HNKG2
         9WGb8VDVhDeV/KOXShHQou3YT5OMqAzRHKVij89nu5VyRBbNeFcNNpnDlVIKR6iFqhYD
         uL7Stelzn556H24tXNiGL0UZ49pBND6omq7FC/8LjaLrMm8d5Gv96iFQ5i+qjSsev46a
         BvVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768857867; x=1769462667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        b=e8U1dkI6DB5g9Ud3jh7ZrVTy4kw65DnWzVP6Eg4qIVVcEXKISsqB52ybMQZcBeUMaD
         LZcu9F7ziqGrw0ASdoTyshMRjZNopbTbORYTCZVfbedPCpv1wtO1FEGdp89jxauvib4q
         3NJsuTh1Exd1N5WmpEmSYzjFR7ibNu/WySddB74fntO4v7GMBCOcu6NaNKlpzglTgCJM
         Hja+JOnzt0nxeenK6VADbOvv+eUdJ+EAkJ9LMUsUyoVzHp9dPVcXTC+8kCBwWtZdZWvb
         SByNFCkjyctX8XolJEzbXChwNJkHp5Z4lGYvpqnsbuiU6ewHLSdneSLreUERv8RBlC9Z
         tbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768857867; x=1769462667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        b=M/Xvwr0N+nAU5ymr058Dz/S8GZvC8qMPyZmNeX9rCMTyRvJ1CpTA64OnR27ILh6BuF
         VMedmJjjkipoICmnc/GsGrOpOAEpGSKGebk2ceEOrOrSmPYHwLg4NOLDElQDLPJ+9Kfw
         /eOFVZSDy5pusfVOw+pf5t48iY2ODYaI9mvTt1rcH0YzreHLHv4/cnkc+iJdNTfqLGks
         zKkIxG0pNhZkyY58rLSq23f1S/22iU5jXM0+8rDM9bH91JFSYWj4mSRvlml6fb0dYet3
         s6rfE7gTMJHUeP7ymfoWt3oK950uRa06V5hM6SOKpwQGO2IkDWpTimoCtADWQAkU4SkO
         4Qqw==
X-Forwarded-Encrypted: i=1; AJvYcCVzE9HE5um1QGfWdECIFaLB68XxwLruBGd4Q9s/T+1LSgZoMyXIDtekHTQY3vsM6LVV+kWZO0BMKq5vxh3CB98Ngw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7KrBYyDoBJa7sWQwPCktxdo5dySDEjPCuLJANxZyW9fl3U/c6
	YvQoL7XrMisGovZ2gIOsPjAJIIbO06Fc51HSZZIYC0+53+aOpD8XOi5fpIityhvkSEIUrhFFRUC
	83owq84sQ9wbgGe6txHsw+1R2inqMbaU=
X-Gm-Gg: AZuq6aKp7udHnfcNLDLQ5xmhymQLg03jzAKP/TyL6VIf8DqJkLRbRU/ERcC0kzxqFB0
	qt7kJa/IhBX6e2tBdGKcop0muGRHpLsEnSWLDKwFBdtx1D9LEUpvLSSjyK2MfM5KN+4xeatay69
	/CsrGcXqv4GHbslU6wRzkvMsSnuzLB5WEfZnm0PRcROaAYaRlJIZplwTT5MG9AbCNpHZ8aD8r6S
	CXDq+bc764Ct9juHixnB4F/DU24wChZwjfYDoAWpvI16+Q4GLzWJwxrFh78ILCYKlBC/UR3DUA2
	hBocOLak3w41pPQYZwqWPIQk4USuk6vcLA36GIQ=
X-Received: by 2002:a17:902:e787:b0:2a0:fb1c:144e with SMTP id
 d9443c01a7336-2a700990c98mr136201155ad.7.1768857866821; Mon, 19 Jan 2026
 13:24:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
 <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com> <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
In-Reply-To: <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jan 2026 22:24:15 +0100
X-Gm-Features: AZwV_QgxI3L9klOeJM7lsCljCRIK_bf05uJfhQMd5VWt4KtGJ4pArfXR_EjKQn4
Message-ID: <CAFBinCCz+MobtXYdiyWRBBFBDo77iULLOZ1p2i4fAVnpJ1NzJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Tue, Jan 13, 2026 at 6:31=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
[...]
> >> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *d=
ev, struct device *master,
> >>                                    void *data)
> >>  {
> >>         struct meson_dw_hdmi *meson_dw_hdmi =3D dev_get_drvdata(dev);
> >> +       struct platform_device *pdev =3D to_platform_device(dev);
> >> +       int irq =3D platform_get_irq(pdev, 0);
> >>
> >> +       devm_free_irq(dev, irq, meson_dw_hdmi);
> > I have one question (so I can understand things better):
> > is there a particular reason why you went with free'ing the IRQ
> > instead of "just" masking it (so the hardware won't fire anymore of
> > those IRQs)?
>
> One reason is symmetry: _bind requests the irq, so _unbind does the
> reverse.
>
> Another is I don't have the hardware, so I wanted my changes to be as sma=
ll
> and clear as possible.
Understood, thanks!

> In principle one could request/free the irq in probe/remove and then
> enable/disable it in bind/unbind. Whether it would be a good or bad idea =
I
> don't know, but surely it would be more complex and I wouldn't want to do
> it without any chance to test it on hardware.
>
> Also, that would only optimize the case of multiple bind/unbind cycles,
> which are not quite realistic without bridge hotplug. And brigde hotplug
> does not exist yet in mainline, and when it will arrive it will be used
> only for a few use cases.
>
> I hope this answers your question.
Yes, I was curious whether you considered devm_free_irq() as the only
"correct" approach (in this case I would have recommended a comment)
or whether other approaches are fine too.
This is useful knowledge for me in case we ever need to restructure the dri=
ver.


Best regards,
Martin

