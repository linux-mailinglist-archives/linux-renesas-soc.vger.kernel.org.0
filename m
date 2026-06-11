Return-Path: <linux-renesas-soc+bounces-33864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EwpeNIh8Kmp/qwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 11:14:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0166704D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 11:14:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=ekIXc12a;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3A993016D8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 09:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909973B9D95;
	Thu, 11 Jun 2026 09:13:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E79D233936
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 09:12:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169182; cv=pass; b=MDDd9LbjvpiVajyhwv6f7FSnDoabLZwwPejqhDKvTMJB14MadkifFLNEllByYW6GcuikYZAyjDHVquZ0UcVwL2kAHUaQwF5tpIl69Laqm83fAHnIvVVUXCP7i42tAgTUBN1M64Nld/yhIctUfAvXxcpexrkBfHUtY1wNZq0hfCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169182; c=relaxed/simple;
	bh=hoj0ig+CoCGbFQUO4jVjy2N6O6hJkky1VIHSBDR3r70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mp0wAb7YNnC6kYxtAHYusfbeoofGxo068EIX93Vg9gsur8VpnZwV0+o5inkocBtNfFFT1e3Jhg3r8zunX6yeF30HF+xO71S29dl1ecAtWP7p8mHMdnOk7nrcrZZmtajjD6sC9sopih6YO5AH1VJAIpAeN1CcGRXU5DYSUv46KEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ekIXc12a; arc=pass smtp.client-ip=209.85.128.176
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7e8b45dfb3dso91542647b3.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 02:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781169178; cv=none;
        d=google.com; s=arc-20240605;
        b=GDPPDac7w8unTdUSsKU/k9NPoXlMGQL7q76R9g4qKiL36TIUzcEQWAFyfXwpDlyeM3
         kDD/RrW21tKt2eP2iB/s1z34JWHCKa6UiLDw08PdCmz5C6TbAlMeZC3gVib0YId1hnVf
         H2k8mVjWF8SAvfK2BTINNZzw37fQCY80IYbFc97zmajz1uofRc3uCYOu0B1Mo8IUiUpM
         SU+BDyEgeZHahEWiEoLN1JDXZlWVG28G32lOY/cFXJ1OStNOeaFxp2VE39oL0AyFT88x
         pu6YuQBc4zw7I95tNjJcVcaVqJowN0hzAiIYhu8sBSUSd9wvZlavxKI/vSdkkzO9R+Ga
         HcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MYKB6iu0PDtjrE3F0ztsAOmxTHIzR1YcZn5jcZ5lz6I=;
        fh=xR7yp8UELAIqEzwMl3cQXHDcPbLqzQdiMLAMSuihht0=;
        b=ll34SNsb6EfNOLcpU79qv9zFtFEhY22ZZsnUen1fOLBZeMpeCfZHXt65pcKPzFCP8/
         Vo6uz15yW+QLsoHNQ/tz2AFkyFX3G/CSzV/gMJgd2f4IYuC5F7r79Rd3bRCVmaL1eBKz
         r+NH78g1CS2ifj/fA3eFxVlBWrpPyZTzCzTuV//h0dlvi5sh+6le/2Tj0XShJsbqa7pw
         6FUccMuhU1ty3oCLK7+7aPpaT80CTBT0xGOnrrFpobHSLhobKq+sgu7CBJPN0QewraCN
         SbECzwQ44FkptGc+BJtEMXFkA1THPDGRzARGfWfzPQL4drZF5RIynY/tAD/cQT9DkNA3
         +Xwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1781169178; x=1781773978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MYKB6iu0PDtjrE3F0ztsAOmxTHIzR1YcZn5jcZ5lz6I=;
        b=ekIXc12afGVdUxXaQYa5y2/VWZnuBX4t1DzfChztT7VR/BCX01A18IiP3aLdD7wUXO
         6Moo1qZIvSjzWVu93WSvxTxPh5LhTLIfaO6cJds4bK1SSV0cv80TOQcqtfBR3a/cyCvq
         07KkEGWcWzuHV2Kn/ccQV8AIYv7dY/QAAlQANNqjeloZr9VS6p63Hma6cRvZV1JBGjMS
         wNX/0euW/dyuwUw62NQVafyPz3dcllMSe3pYXMXSFh/dCZyDscbwhc+b40yPdEdf4iel
         4GvwLMSHtm3hN0SYYTsiRR31vOy39aNfn4iDEMYWFfdA1uVYW7sRRU+0IWtdMjYXE1eR
         DqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169178; x=1781773978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYKB6iu0PDtjrE3F0ztsAOmxTHIzR1YcZn5jcZ5lz6I=;
        b=GpZ8b6OTuCu39y2g2Xa+Q1ZEdh/nVpaq+P+wRgIKSBoDYOJnDTgUe9KWWia7oEpxLp
         OKu/7g88Eq8IhPzEw0DhB/POvAtX4iG6KkrLRBoehNnMLTZb6j1wEkMW6a5bXgzPBAyd
         j0FvCblj6JPXsS6USAf2bZfUibg/FM0U3d2nFXOkCOP4Tq2G8GOlI9U8w/58ZkYZGLyz
         Py48C6uHX+9NCMlg73YEW9bh8+yREnKIdZNccy7CQIpMAsvH417jLWAjE9bvxoCBuTeo
         r6CDcWjW1Nyip8rI+Nj4l8dFR68eYWXN/b7zV/rbVwblVV+maZaAjPTd+8KFpFdalQsL
         Stbw==
X-Forwarded-Encrypted: i=1; AFNElJ8ix/cQJXtegbiedSrsYTFpCaaCGdxtexg3CvVMGFO9+elA0zNEk8Dq8QLMB8n9Juo+J4O9kaeWYtcr/kGljlBscg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDbDy41TSr1vu1XA4kUVyc3+dmt2CuO15BTE/oOHGkOO35PwBu
	gJr6Sq3mnQ9Pp4IbkyyxT2qAs+6SXH968F7OAoXgGGMDRExkJ36FL7IFEoxkQC/57AYVDV/ISye
	Ru3IW2/ZLw7wiH2bwSRngpY5NilySHWTU9rQjEUcLmA==
X-Gm-Gg: Acq92OEltGUC40FkqKeoHGDDfQQRD7wHFYGQcMvd/bBqh18E5uvT75w50yjMxDsCOZC
	1qD84ODJh+70e6iITbTCFmj8HFSrWzXJCIlcXLcGmEXkFqtgr+JxfwTfADlmEBV9errxOVjxsYB
	EB8JMjIfzZXXtadwkGiFLq34a5RDEOb9zx1l2jB0lAIdhrFkS5V4G7dgfoD61vRk3sAzNftla70
	TgtnkvgAyjshxGNNC32S2KoXxBMbklAO5hVZuVFEvtnlfw2o6mKmwWXGJLcN3+jJl/+pM69+NHP
	jVw0zHTSRyB1CPQdAMGAF/stS32d1xA3OhMXeYSFTaPhg1ZYRcUMt57stv/hu6VzIF5u1107w2w
	bBy9/HQyE5ib1OdYTc48rGoDI8oyx5TzL4MA=
X-Received: by 2002:a05:690c:490c:b0:7dc:605d:7a9a with SMTP id
 00721157ae682-7f655ee0d17mr21296917b3.12.1781169178177; Thu, 11 Jun 2026
 02:12:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org> <20260610-media-ci-7-2-v1-1-3c61a482a44e@chromium.org>
In-Reply-To: <20260610-media-ci-7-2-v1-1-3c61a482a44e@chromium.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 11 Jun 2026 10:12:42 +0100
X-Gm-Features: AVVi8CfaG3sU9PQt2tyzbFw_FkBWxmHg2PzweaVreKbZNnE6xiybcEosb6zW1uw
Message-ID: <CAPY8ntD=f_S8fjOG4=3viScGMVEsHWivs7qn=X_-UqvqB791wg@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: ov9282: Remove unused kerneldoc description
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Xiaolei Wang <xiaolei.wang@windriver.com>, 
	Tarang Raval <tarang.raval@siliconsignals.io>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33864-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:dan.scally@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:stable@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,cisco,huawei,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,raspberrypi.com:dkim,raspberrypi.com:email,raspberrypi.com:from_mime,chromium.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB0166704D1

On Wed, 10 Jun 2026 at 17:20, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> The field has been removed, but the kerneldoc not. Let's take care of
> this.
>
> This patch fixes the following warning:
> Warning: drivers/media/i2c/ov9282.c:223 Excess struct member 'mutex'
> description in 'ov9282'
>
> Cc: stable@kernel.org
> Fixes: 0c69a963a300 ("media: i2c: ov9282: Switch to using the sub-device state lock")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks!

> ---
>  drivers/media/i2c/ov9282.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 5b6f897a74fc..3ba630ec4f2a 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -197,7 +197,6 @@ struct ov9282_mode {
>   * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
>   * @cur_mode: Pointer to current selected sensor mode
>   * @code: Mbus code currently selected
> - * @mutex: Mutex for serializing sensor controls
>   */
>  struct ov9282 {
>         struct device *dev;
>
> --
> 2.54.0.1099.g489fc7bff1-goog
>

