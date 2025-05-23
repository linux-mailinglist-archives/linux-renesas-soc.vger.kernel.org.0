Return-Path: <linux-renesas-soc+bounces-17429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B98AC2146
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 12:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 549024E2B78
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 10:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17318229B29;
	Fri, 23 May 2025 10:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="qdU3KuMZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE0222839A;
	Fri, 23 May 2025 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996842; cv=none; b=NfTEblRRr2tE1qzSTUwuQxSJsEcSsIhwt+m0Ty/DfXloF003XYnOy4CIE6pjBbPgoJLaEHDa8BWwS3LYG6kPpIRl5DQAFwZAS6E4kGTVc+yagIhjNUynE1GqfS34fWUxoSYjutOH51GRokWtSpH97zknOREen5mU/T7JVwiHsbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996842; c=relaxed/simple;
	bh=K2JQO+uYU43rONsrKzctsDigqQZ79oxfKv9WnQ4M8rs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TVVI1DJnG68vVC+KaM4Ko28QwIV5lcs++PvcvWA/rwYSbV2yjO0oupYm6XSG/IvKYy0m/+6Qg3fDEH9a4KLt5pCzFu2cLLN4k8FzTZbkrrvVs1oK2XmiUPP6TzR8mkmFlhKDsjhdANk61QHwMidmM5qoq502wyF0AChKaHNWVDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=qdU3KuMZ; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=K2JQO+uYU43rONsrKzctsDigqQZ79oxfKv9WnQ4M8rs=;
	t=1747996840; x=1749206440; b=qdU3KuMZ9sweprsLMMsnuRdUYa5laczAF/iWMqExK+PNlyJ
	c677zeHd97X1PK7EZWtGUh7fRRZneSmsFVYOWNmxtRoZWeUW+bE6YNr0tKr339HoSGALk73HQssEe
	Me6S6+FPchv46CvtJE6UzDM9LLykPrQIKwbbhxzOAEpnbrnXcYDgaYvogcdzMdIlWEOnbg5n34Dn6
	ywZuDVQsx7W0+b0Rw6imHHRZCKR0ug2sTo9qQKkWDxnUZSulv8t2p0BJRYlibX94khJQFs4bU+EqY
	Osju0I3cb8GSyrBz5uaxzJ9VCbfBYiayFKUNaUPQ51IaYr+mp+fmUxaSoTmIxxIA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uIPp5-00000001O1N-1Ky4;
	Fri, 23 May 2025 12:40:19 +0200
Message-ID: <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
From: Johannes Berg <johannes@sipsolutions.net>
To: =?UTF-8?Q?=E8=89=BE=E8=B6=85?= <aichao@kylinos.cn>, perex
 <perex@perex.cz>,  tiwai <tiwai@suse.com>, "kuninori.morimoto.gx"
 <kuninori.morimoto.gx@renesas.com>, lgirdwood	 <lgirdwood@gmail.com>,
 broonie <broonie@kernel.org>, jbrunet	 <jbrunet@baylibre.com>,
 "neil.armstrong" <neil.armstrong@linaro.org>, khilman	
 <khilman@baylibre.com>, "martin.blumenstingl"	
 <martin.blumenstingl@googlemail.com>, "shengjiu.wang"
 <shengjiu.wang@gmail.com>,  "Xiubo.Lee" <Xiubo.Lee@gmail.com>, festevam
 <festevam@gmail.com>, nicoleotsuka <nicoleotsuka@gmail.com>,  shawnguo
 <shawnguo@kernel.org>, "s.hauer" <s.hauer@pengutronix.de>,
 "srinivas.kandagatla"	 <srinivas.kandagatla@linaro.org>
Cc: linux-sound <linux-sound@vger.kernel.org>, linux-kernel	
 <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,  linux-renesas-soc
 <linux-renesas-soc@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>, imx <imx@lists.linux.dev>, kernel
 <kernel@pengutronix.de>,  linux-arm-msm <linux-arm-msm@vger.kernel.org>
Date: Fri, 23 May 2025 12:40:18 +0200
In-Reply-To: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

Hi,

[you should avoid HTML]

> "simplifies the code" is no need to callof_node_put() .

Fair. Except that's not what you _actually_ changed here. Like I said,
either it's buggy before or after.

johannes

