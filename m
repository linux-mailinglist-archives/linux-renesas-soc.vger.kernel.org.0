Return-Path: <linux-renesas-soc+bounces-31084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOOlFH6c12kUQQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 14:33:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8913CA749
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 14:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 647513008298
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 12:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929B73126C4;
	Thu,  9 Apr 2026 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DyzgqXrR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBD93ACF06
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Apr 2026 12:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775737978; cv=none; b=mYogSUITLkyVZ7576W3tydFR4cOtxTjsSc/lzYmyAG0KEam/nsIF51RkK9xFKeUbnVg/2elNTIVZxkK5/PNrWyOk/vezdmV389SYRGEP4IDZgVRGeUT4iVWRBqJMEHQdmpN/eSxyqoskJFEv4a9vCvvS4M+/VffefdCY8y7RXyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775737978; c=relaxed/simple;
	bh=Ln84Y8daQea+2WOulMVSMx0akapVCMbWIWoyskxDfbA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=pHmyU3xqjXxkA2c5pRs8z86SO5X8qW2IMEPCxbiZKZPPNerILwY9Q4GbT03SpNR1ZhhQ6ztoPzEiavF33eDOJCMIOecEge5GNsu/axjufYyykMQYrPD5p1t7i9DmcefeJ32MfVi9xTbgRKeSitdnj++6m2uvuasUV1L9AdnI5OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DyzgqXrR; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 36DF11A324B;
	Thu,  9 Apr 2026 12:32:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B1A15FDEB;
	Thu,  9 Apr 2026 12:32:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 689FD104500B3;
	Thu,  9 Apr 2026 14:32:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775737974; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NlAwiGhuruWujtQsUbIHEKN+5wk3h2jyp0hAH3Upjd4=;
	b=DyzgqXrR8WIFvQgN+NCo7J3cGM8quSxsJQxUKaHfcBgBaWNK70OQpcjraeUvhgE9miqgyj
	5LhNQ//7hcAgx9Lsh6WzMc3K184BgGlE5n6BVb9IaUI/ANg+jk6tbxNDxBcZw3UBoEMeDM
	7DPp9PVl+c3YbNz2CTS8jd2qzOzFHWDvwHCbInvRrM6Bm+RhVaUs82cAQ5S2xFFMbPxNFY
	pLDLq3R6EJx91nMS6C/Hzywnpb6YpaKiHXNInx6L6LJOADFkRCP3NMR6NGQGP2d98cYuXY
	ZClS0t32xnKTz+WxvxLT88GZImWJzsYmz7LkUUn/U+Njo0jzZLhqIOsJtycCNg==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 14:32:48 +0200
Message-Id: <DHOMKP0HTRDS.Y387S55LZNXL@bootlin.com>
Cc: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Biju Das"
 <biju.das.jz@bp.renesas.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Anitha
 Chrisanthus" <anitha.chrisanthus@intel.com>, "Linus Walleij"
 <linusw@kernel.org>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 1/4] drm: renesas: rz-du: rzg2l_du_encoder: convert
 to of_drm_find_and_get_bridge()
X-Mailer: aerc 0.20.1
References: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com> <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-1-421781c8c061@bootlin.com> <a3c30888-9818-4355-9d09-5398172cd698@bootlin.com> <DHNYGMWPQWLM.3OBWO5G9NPWK5@bootlin.com> <20260408213339.GM1965119@killaraus.ideasonboard.com>
In-Reply-To: <20260408213339.GM1965119@killaraus.ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31084-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be,gehealthcare.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid,bootlin.com:url]
X-Rspamd-Queue-Id: BF8913CA749
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent, Louis,

On Wed Apr 8, 2026 at 11:33 PM CEST, Laurent Pinchart wrote:
> On Wed, Apr 08, 2026 at 07:39:03PM +0200, Luca Ceresoli wrote:
>> On Wed Apr 8, 2026 at 5:44 PM CEST, Louis Chauvet wrote:
>>
>> >> @@ -83,10 +83,21 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device =
 *rcdu,
>> >>
>> >>   		bridge =3D devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
>> >>   							 DRM_MODE_CONNECTOR_DPI);
>> >> -		if (IS_ERR(bridge))
>> >> -			return PTR_ERR(bridge);
>> >> +		if (IS_ERR(bridge)) {
>> >> +			// Inhibit the cleanup action on an ERR_PTR
>> >> +			ret =3D PTR_ERR(bridge);
>> >> +			bridge =3D NULL;
>> >> +			return ret;
>> >> +		}
>> >
>> > Can't you use
>> > https://elixir.bootlin.com/linux/v6.19.11/source/include/linux/cleanup=
.h#L230?
>> >
>> > return PTR_ERR(no_free_ptr(bridge));
>>
>> Ah, nice cleanup indeed! However, being this patch already reviewed ans
>> tested, I'll postpone this cleanup to a later series.
>
> I think this modification is minor enough to keep the tags.

OK, thanks for sharing your opinion! I'm sending a v5 of this patch and
patch 3 with that change and keeping the review tags, and apply them in ~1w
unless there is new feedback suggesting otherwise.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

