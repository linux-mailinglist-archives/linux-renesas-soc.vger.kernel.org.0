Return-Path: <linux-renesas-soc+bounces-31089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI68LdGi12kUQQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 15:00:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F24C3CAB2E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 15:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6345E300751A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 12:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF8F3CE494;
	Thu,  9 Apr 2026 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2XO3zMlu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBE13C063B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Apr 2026 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775739597; cv=none; b=WGMBBH/e05QFAheBH6HQOD5BzWlf75iY/jp4q+BvGHLenu4FPDWp4gW1+8Lqe0KrhoorqBmUk//Ea3ZCVwdQnp30en+rdap7s6Qwlina5oQZKhXcRyh9VJyRtw/bm6bhGeNbOa0SgBAHoIBwxHknuA5tVG8vTTEUXdVhz3Qsp+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775739597; c=relaxed/simple;
	bh=39dGIe6zpX+jq96n3uGWgmWVcoZubHfPCcQ1/ymalUI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rre4s6Wf26S7q+Z1PLOfc6Z8M/gqjxBDxKWAIfZReh4p+za6vsDgejyAvmOihYsabn1BDgwIr4T2FZdzSkwhd2xqITgfallqvk2Ac/eLYTGveNjqC8FQmh751nLXvACT+oWq1QFQEQu50AsIPNH9saZxlByOcZoX7Q8bLd47goo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2XO3zMlu; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3255A1A323F;
	Thu,  9 Apr 2026 12:59:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 067475FDEB;
	Thu,  9 Apr 2026 12:59:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95530104500D1;
	Thu,  9 Apr 2026 14:59:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775739591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FaLY1aQnVJcUtH7eLmSXgGtNhbFOg1g8aL2wXPzaJlU=;
	b=2XO3zMluVR5//7iYnJW2K4dpEtiENy/DTuWBNYN+2XR66JN4Oo6R2a0aham9FQkAH6yryq
	k4+RIIqhimAjWtkbehjvQIQZXh7jK123E7TQLoYbDn3jnqLDwQ9akiVzekq3TAsvCxGvKe
	ISyrqr6n0LzplY8huCEbKtU52SQDYiXCARyIO1E4RDwhKzRVqWOVg+w2db+MKafJVhiCiF
	jF7T8MoeUKScqZDlg9pC3ooGvn8uV+KMwogLFZi+ahmm1w3AQkZjD88ufgl4aCB6AkmUKw
	VBMiazIYiN9MWs+SeZklDyPiqcbLl7CsUWBCqiqy8Xk6bZhFqhpwpun14l700Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
References: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
Subject: Re: (subset) [PATCH v4 0/4] drm/bridge: convert users of
 of_drm_find_bridge(), part 4
Message-Id: <177573958628.643939.4244326397427254183.b4-ty@b4>
Date: Thu, 09 Apr 2026 14:59:46 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31089-lists,linux-renesas-soc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email]
X-Rspamd-Queue-Id: 4F24C3CAB2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 02 Apr 2026 18:27:16 +0200, Luca Ceresoli wrote:
> This series converts many DRM drivers from the now deprecated
> of_drm_find_bridge() to its replacement of_drm_find_and_get_bridge() which
> allows correct bridge refcounting.
> 
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [0].
> 
> [...]

Applied, thanks!

[2/4] drm/kmb/dsi: convert to of_drm_find_and_get_bridge()
      commit: abbe7f8144d532354723dd1c5ab0daf41aa9706e
[4/4] drm/omap: dss: convert to of_drm_find_and_get_bridge()
      commit: 0a7f39ba3ffcb810150d95237ee4e089fa522a93

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


