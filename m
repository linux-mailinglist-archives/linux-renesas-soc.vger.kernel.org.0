Return-Path: <linux-renesas-soc+bounces-35012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dwgeC4awUGr93QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:42:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6A0738994
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:42:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1240F3061966
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 08:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E1C3F0A9B;
	Fri, 10 Jul 2026 08:37:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0730B3F1676
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:36:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672623; cv=none; b=Edt+2PnqerBc6tkxTY1YhPhephXwKdpr8XLpPBt48k2dzBj3JxNYeY1nSHAYuCN4W+YZSzUkr7Dv6earmXwhlautejITmW2FViH9CTJpGxExbO0h4hvrFpQ+FVP4APBVaB1fseRPrg1Qly80Rf/hl2VqSTrtUgrDy8xyeMxmJ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672623; c=relaxed/simple;
	bh=EeoOMqO1p/YM13KYTy1063EaCdKHKafxTRlP59YUdoc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gG5eGyESi+fYODmykcWGjMDIqHf4R+6I0cEIiPHjw8nKr4GSMvWPoDAhN7rtycq1za1W7fc6J1xS/juj13coc9I150+zG5oo2la0mxKf8hd5CQowlcXS+xQrFaHkyPuTr23cRA9M1Qkw2bh3CQEIeZXHj5RKSTh6FpZbRpdTCSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wi6jA-0002ZO-MG; Fri, 10 Jul 2026 10:36:56 +0200
Message-ID: <210aa2ee-8931-4dd2-a51f-eeb0c205d647@pengutronix.de>
Date: Fri, 10 Jul 2026 10:36:53 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Subject: Re: [PATCH v3 2/4] media: v4l2-common: Add v4l2_fill_pixfmt_aligned()
 helper
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
 <20260708161406.396183-3-tommaso.merciai.xr@bp.renesas.com>
 <ak9pPzjABetdgUiq@zed>
Content-Language: en-US
In-Reply-To: <ak9pPzjABetdgUiq@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:tommaso.merciai.xr@bp.renesas.com,m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:m.szyprowski@samsung.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[s.pueschel@pengutronix.de,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-35012-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,kernel.org,collabora.com,linux.intel.com,ideasonboard.com,samsung.com,crapouillou.net];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,cisco,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,pengutronix.de:mid,pengutronix.de:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A6A0738994

Hi Jacopo,

On 7/9/26 11:35 AM, Jacopo Mondi wrote:
> Hi Tommaso
>
> On Wed, Jul 08, 2026 at 06:14:03PM +0200, Tommaso Merciai wrote:
>
>> + *
>> + * @pixfmt: pointer to the &struct v4l2_pix_format to be filled
>> + * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
>> + * @width: image width in pixels
>> + * @height: image height in pixels
>> + * @stride_alignment: stride alignment in bytes, must be a power of 2
>> + *
>> + * Fills all fields of @pixfmt for the given pixel format, dimensions, and
>> + * stride alignment. Only formats stored in a single memory plane are
>> + * supported; returns -EINVAL for multi-memory-plane formats.
>> + *
>> + * @pixfmt->bytesperline is set to the stride of the primary (plane 0) plane,
>> + * rounded up to a multiple of @stride_alignment. For formats that store
>> + * multiple component planes in a single memory buffer (e.g. NV12), the
>> + * alignment applied to each component plane's stride is scaled relative to
>> + * @stride_alignment so that the chroma stride remains consistently derivable
> Does this rather mean that
>
> "For formats that store multiple component planes in a single memory
> buffer (e.g. NV12), the alignment applied to each component plane is
> the first plane @stride_alignment scaled by the plane's sub-sampling
> ratio" or have I mis-read this ?

No, for the example of NV12, no stride will get scaled (although the 
sub-sampling of 4:2:0, resulting in a vdiv and hdiv of 2).

This is due to the fact, that while we have a hdiv of 2 we also 
interleave the cb and cr parts in a single plane, which results in the 
stride being the same number of bytes as for the y plane (and vdiv isn't 
relevant for the stride).

Therefore the stride scaling also respects the bits per plane (bpp) 
value to determine the scaling.

@Tommaso : While the sentence looks ok, the NV12 example is misguided. 
The intention is that for non-mp (not ending with M) formats we might do 
the scaling (e.g. YUV420 will have it's Y component stride alignment 
scaled to not break the u and v stride alignments, but YUV420M not)

Sincerely
     Sven


