Return-Path: <linux-renesas-soc+bounces-33847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p5jlDdDhKWrHewMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 00:14:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F25866D29F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 00:14:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=FJTVJtxJ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8DCE3030D6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 22:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C852B357A3E;
	Wed, 10 Jun 2026 22:14:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A557331EBF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 22:14:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781129675; cv=none; b=em18P3RjwJuv5wAp8cW48TpxDd8NYwE85KDBvJbnyVT8seEgYxNwuwVQiS9NAhmuSwjxWqURJuDpaeBq7VHbKNezSyKNWZhdE87MzZDpXN39gxSAWKoJuVQKTSJTFHBVSvLB9u0qzRcn1fvFhYqKj6yc9diJKVGizA2ngSx4T4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781129675; c=relaxed/simple;
	bh=mTLDVINarZaJr5azCL8guqrK/oiTW8Ahtnhf4kDMrpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q5/CHfgHtVkMwIOhnKkOMMkWJCHG3ji73KmJbJzsSkTkToVNLXLAHwbbm6jKrqyLmH1Nj4SK+vKmVkn0JidEXaTHvUUfTaUC36cYA8X6C3iVZdpr5XsQDtaczfXnHR30Rd89OEcyYw344AfEYIRIpHKeveXXZ/fJNo5ZzsuuI/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FJTVJtxJ; arc=none smtp.client-ip=209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69165354c87so5827135a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 15:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781129673; x=1781734473; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MBH4Ky0PfRH1lV1hmQ6CbTQcq6+3YnY1hBMssQPxZyU=;
        b=FJTVJtxJRckSrm+24MtS906N1t4OcyPHAg6ANmcsBmgjaDsSxHFePFJrF3z1MoDmtW
         hmAMP/0DAzRtLtL89lw/lUMtviFP5LRy28g8nUPaUzlHeyuvWMFWnHhAixJHQbtea0Hh
         wqGtUF7H5s0p/sjIUb3AX/NDSC7vQfMk8anLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781129673; x=1781734473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBH4Ky0PfRH1lV1hmQ6CbTQcq6+3YnY1hBMssQPxZyU=;
        b=WXph7FPdE5eSEAgHvE6zHFtygW9SBfaU7BtBq38wWxIgilmBEkZ2e9R/UjsobqDK+f
         ZRBT/C7ZZe9lFvLjlHaT5q6sTWU27/6RCgf1+wxH1QMLtMpIz+h+7DlztIRdiv6Sy/F4
         PKuY1hvOExJKnx2zYoOnxsaiIZGU7VkSoEDfCYoaNJAavsQzxwSbDRxzrgAZleOJSQJT
         d7b73BTPWspYBHtopcx4otKxnULUQdQGJQ89WwkSRoTaGLY0z2ShZURPGjcPyaGoA2+8
         +7S6yrZ6l+UcpyzAUenyTKS8yHYWILzbMG5wqxPzrIE7x5y0we2L59eR7S8xKPVp2UCC
         f7iA==
X-Forwarded-Encrypted: i=1; AFNElJ+e1pH3NrM0YbKLZeXm5oMVXgyJ2279gUFF7zcB0cNtGxltXB+KxPFl98b7oH8tD2+eT8dNE9r0jHnSs5LoxC0m4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YymYjGjYQSj+CfECz4CxUqaU1gwEQ92Knn3LLSes4eD6MRxHCZJ
	lCX1FnWyL2fdhrZkpbDNpN3n5pTnaNNvddEsADLNqDbOZfS0Ipe4clGNhv199jmKqKtttE4P/9x
	4au6G77QV
X-Gm-Gg: Acq92OExuw4t9iJqnSq6ZaSNObUdtduVtSAxBen1lYUn9IIsPU7I8UFn2I9BVnxUYdJ
	kdFANrhNdp4i7isIyiytAqeoZro6q58F9iKuprowPwx7hjR0dAJNVvJI2E7RxjAR8DofyXqb1vb
	GgQmg0nOXmlY92/y87e0uMBuJVpodZ7ZulLtZ49IOXNkX6vCZGeTuOP28tu5TWYo76aDBKayoId
	7jWoeyA/H4jJESfM0hLhqXuPLwNksHput0t05ccrCEIhT93gFxK+KQ8dLDPVFdFAr5PK6zD/1wg
	Asp5dDM8ZC3kInDZsz9Gr4FqF+UDKfyWUdQpVSfgb0EtmEZxyxjr/pIXDBba8BmzlcMqVRDDliP
	dbICABCWIU8KyxVFCa0xDdUkcMqYlmdrm9vXJ9kvvTWtfVRO+DIXpfNhRRWgDo+pf04b3hyxNq7
	LbCGdORY0LANQ/dTU2X8hGzUSkwhYX3yEUnGNzDAkQjHFvshMLMonq/Dq1X+PVGSc5RkHgzGk=
X-Received: by 2002:a17:907:3f20:b0:bdf:8e2a:1092 with SMTP id a640c23a62f3a-bf370e639e5mr1430645866b.3.1781129672848;
        Wed, 10 Jun 2026 15:14:32 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf41f05041esm828469966b.62.2026.06.10.15.14.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 15:14:31 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68c19f1f3ceso11781236a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 15:14:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9mAMJV9Sbwsv2GepaFuTpoy1JgM0aVZbQXrVXV1lMoQzJaIjkou0DtzgfNltX60yshTtaNGrugiwQildMBMBH3QQ==@vger.kernel.org
X-Received: by 2002:a17:907:1988:b0:bec:203f:7466 with SMTP id
 a640c23a62f3a-bf370e629dfmr1399587966b.8.1781129670185; Wed, 10 Jun 2026
 15:14:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
 <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org> <20260610202124.GB1384932@killaraus.ideasonboard.com>
In-Reply-To: <20260610202124.GB1384932@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 11 Jun 2026 00:14:18 +0200
X-Gmail-Original-Message-ID: <CANiDSCsOdB7scqmLT01Ehe7gDaiy-5HX1NfPOtgQHi+vNbd-tQ@mail.gmail.com>
X-Gm-Features: AVVi8CdTF4yTQJtqiEKlYfBQtnih2Y53iWj-G6zZEOegl5hWcbxzOEozFhI30IQ
Message-ID: <CANiDSCsOdB7scqmLT01Ehe7gDaiy-5HX1NfPOtgQHi+vNbd-tQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: rzg2l-cru: Remove unused kerneldoc description
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Xiaolei Wang <xiaolei.wang@windriver.com>, Tarang Raval <tarang.raval@siliconsignals.io>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33847-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:dan.scally@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,cisco,huawei,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F25866D29F

Hi Laurent

On Wed, 10 Jun 2026 at 22:21, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:20:07PM +0000, Ricardo Ribalda wrote:
> > The variable has been previously removed but not its kerneldoc.
> >
> > Also remove the leftover reference to state in the description of qlock.
> >
> > This patch fixes the following warning:
> >
> > Warning: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h:164
> > Excess struct member 'state' description in 'rzg2l_cru_dev'
> >
> > Fixes: 85d8820d4869 ("media: rzg2l-cru: Remove the 'state' variable")
>
> Does it mean that this patch was merged without going through CI ? Is
> there something we need to improve in the process ?

Something has changed in the kenel-doc script. If you run this in
media-commiters/next:
scripts/kernel-doc -none -Wall
drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h

There is no error.


>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index 5bf334e173d2..b426bc7898bf 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -116,11 +116,9 @@ struct rzg2l_cru_info {
> >   * @scratch_phys:    physical address of the scratch buffer
> >   *
> >   * @qlock:           protects @queue_buf, @buf_list, @sequence
> > - *                   @state
> >   * @queue_buf:               Keeps track of buffers given to HW slot
> >   * @buf_list:                list of queued buffers
> >   * @sequence:                V4L2 buffers sequence number
> > - * @state:           keeps track of operation state
> >   *
> >   * @format:          active V4L2 pixel format
> >   */
> >
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

