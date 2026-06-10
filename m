Return-Path: <linux-renesas-soc+bounces-33839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fwS6GVeVKWpraAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 18:48:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD566BAAD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 18:48:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=UXMjDjRI;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7311E3051AB3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 16:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45E533D6CA;
	Wed, 10 Jun 2026 16:42:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411BB165F1A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 16:42:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109758; cv=none; b=dHr+fnvV7OIKFkAdbxEwmaIpPFc8Cj2KP/XzpUA8Z/G+O34myMOX2xK1ShRseQPxn6GQU/7dcCkZi6mPE8JSXNdSVU5X71FagnkRCw/F+cNg/FxoP0NceGbD4iRJAVfXlng7eIlylmwnEOH0fl+U4FXKpbcLryzB61YMqmtqbY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109758; c=relaxed/simple;
	bh=uQxgwEhkxvGh3wPUWl2uJvJ7E0TFEraUZkKD7n+myRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8DDRBGy87FhHqoVIW+HYgDK476wycEWUZzQx/1PlsogD4N8NJTvh/g8Sfi0mbLx1soW7gPIw9dbVTXQuVNZx1O4s4yc6Z1nj/1+o1eYi/pB7b2Dj3VuQGAHOgQ3i8iHNIN1k64O0bZG2ojAHZ+GH+0Rd7ejLZ7Tr0IS179OT2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UXMjDjRI; arc=none smtp.client-ip=209.85.218.41
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bf1cdcfd6deso862892166b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 09:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781109756; x=1781714556; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y7A0TGEQnK+KXtF3xm89dBL8qudMISx4jNxtMKf9lW4=;
        b=UXMjDjRIhQtthmkHNCOVkg4XQLTf8TVK2JAK+449ZvXJS0Y6PVMJCc94dW1GpiHEvp
         AJMI9HYfWL4cSquwoGNdbzbz48Ih9wKbqmLZA56D2XMqh81qqPqnatOnqP3kXDhG4i1R
         1u0OTC3ZU2i3gFUF/kuRfHE3hmzcGnEfnvHHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781109756; x=1781714556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7A0TGEQnK+KXtF3xm89dBL8qudMISx4jNxtMKf9lW4=;
        b=JORG04FsorHkttwa2PL9UMezlwY7E+IbWdBsO4i1dwZQTyQbuoNQ9ibDKO6hNmwP4U
         RLr401ODlAw9h59QR73G2/T3aYd4X0PWwTb1nolFDOeat4mJ0tqYtjI9/sGM7pXamaTn
         XqXkXrQJnQuniZrb4m7HImtNtLwXcyJb4/ksH39kfTUdYwBKlXWFfQ6eFaJ46+VlB3D8
         ztMfkACWE1QPcZW8tqYhUNjHThniHd0fkEeitE2hgSYHgm1kcPENtR6MNOoJ4QdN04Wy
         su89SsnJlz5/98pKQQKPJk8F3plgxYwy0eJUULr28tv7tcCgS7vu/sNyxvbmGpqyvRij
         H0Ag==
X-Forwarded-Encrypted: i=1; AFNElJ9ZpC3PbZ6u9DhUI2hE3N+5oxw6Pvikpsaj+18YCSZPsKDVj4gRtMfRrGp3b8kH5nLE/OSglGNw3gEVuYPrxFCrIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiP/jxHmfY+xiOkXqwM1sgs5SnqrKufRmsspQ0309wAU5HLFVr
	I3VWb4nj7MzglMB5aIMgRVox9RIE48t1/oFuSAvomW6i/iaayR30q8JFokjzzbpxRNNiK/oVlMt
	XbAsANkpf
X-Gm-Gg: Acq92OFuBRDNPaNjf692YCbuOC7ve8ZxxtET54iM1GP8N1saokjHNFwexRUNtpwSyf2
	aisVOaBsCaLEjbEbAtqZyx6AEZ4aPKS0smP6hViK4DS82NqtR9e8xUz2/2/BbCYWnGq1remOZYd
	A7kv2cYB8gn0slDNHQw49tuIqIpy8U7SlmTBtSVfrNMPTiEJD0LBgJIQrKcRpwC0TmFOXbmRL+q
	2cCaw4+8ShHJr6WnsBoBxmUE7MMQzk4y7USEJ/rXq9Ps4vG8oB1kcfqqaKeBqnMKvb55lJKvbyW
	KfIRofoPIgczoo0WQ4qpIhWhjFWp0I6UeiNkVuH9CVwzN9vfzzWpHlFSUtNnr0JNixnNNciwMeO
	iYYhgV8mi/KyiOJqgLhgTy60RIh2UYhuKzmDidhX4hWC5UqvTDnwYfK/WTH0C356B7YUmOxg7kG
	DKoWI/4yVNjJFqsHuzaaMAntIlRrxo0gYJUnDtJkSM1hJI61RFanGMbMY+FT0W1yt9pVzJoa4=
X-Received: by 2002:a17:907:72c9:b0:bec:7661:6397 with SMTP id a640c23a62f3a-bf3734069bbmr1301201466b.29.1781109755456;
        Wed, 10 Jun 2026 09:42:35 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9c499sm1191938966b.22.2026.06.10.09.42.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 09:42:34 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4905529b933so75073975e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 09:42:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8EftgguHLKyqnJJKM1VZwVqFPc60tiR9Tq19HxdYAgTCWN1rbc+zVy5K/cv+4USQ0SaodXvKIN/y80NGgR0PKfCQ==@vger.kernel.org
X-Received: by 2002:a17:907:6e89:b0:bee:d554:f33e with SMTP id
 a640c23a62f3a-bf372049799mr1328655266b.21.1781109348987; Wed, 10 Jun 2026
 09:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
 <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org> <aimQ3ln0y0jxMWT3@zed>
In-Reply-To: <aimQ3ln0y0jxMWT3@zed>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Jun 2026 18:35:36 +0200
X-Gmail-Original-Message-ID: <CANiDSCs=90QH5V8RHFbZUvZMGEN4wz-D9ODHTWgdvyJ7ZS8haA@mail.gmail.com>
X-Gm-Features: AVVi8CdYYd6CA_Y98QxwQ_Ai036ikPBrgSJ3OI6Sn_3TQJnC_oiWjgLHr-W2w_Q
Message-ID: <CANiDSCs=90QH5V8RHFbZUvZMGEN4wz-D9ODHTWgdvyJ7ZS8haA@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: rzg2l-cru: Remove unused kerneldoc description
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Xiaolei Wang <xiaolei.wang@windriver.com>, Tarang Raval <tarang.raval@siliconsignals.io>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33839-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dan.scally@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFCD566BAAD

Hi Jacopo

On Wed, 10 Jun 2026 at 18:30, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Ricardo
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
>
> upsie
>
> indeed!
>
> >
> > Fixes: 85d8820d4869 ("media: rzg2l-cru: Remove the 'state' variable")
>
> My only question is if this qualifies for stable or not...
> Honestly, I would drop the Fixes tag here

Yeah, I am not even sure myself

On one hand, it might help other CIs down there have cleaner logs, it
is very low risk, and I doubt that it will have any conflicts.
On the other, what real user will benefit from this backport?

I wrote in the cover that this can be dropped. I'd let more clever
people decide :P

>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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
> > --
> > 2.54.0.1099.g489fc7bff1-goog
> >



-- 
Ricardo Ribalda

