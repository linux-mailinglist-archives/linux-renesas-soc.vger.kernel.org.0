Return-Path: <linux-renesas-soc+bounces-17489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B2CAC3B90
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 10:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACE5216DD5B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 08:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1036A1DF26B;
	Mon, 26 May 2025 08:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="T8sToZ3s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F6319CD0B;
	Mon, 26 May 2025 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247710; cv=none; b=glHF1xHB8Ky0xx3u0umSl0zlCoB1Qx7J/UTqLbfaYM0lwmRu5W/TWYwx2zOMjKJsXUlr3LAENIZTDuHqTE4UiguZ52l91XVofnUqRwFfWw8klug9TBm+PnniO0tlnlxpQT5u9N5QI2XuAE3hgW8gpCGFTj35zjbZxF9jJ5FFYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247710; c=relaxed/simple;
	bh=kQpQyzSLFXzcV+bV7PWjdFj0k9dCEFAnIJ2CmkjTnDY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JaBnK6YQ0FJhgPGI79FO+rSWsAtu8oXy/Wm+6M+/gxK5Qa8RF6W8gxE3M4iLaag5pzJZYjYjvKQnY31Z7u94x5Te2stvZN8dkuFH5ZvPOMIHk2Y+nZ9Z336DQM8VkwEGD3xqYkkLuDwRwr6xHUmYXS3leQrT3oBVRIioIfRNhFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=T8sToZ3s; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=kQpQyzSLFXzcV+bV7PWjdFj0k9dCEFAnIJ2CmkjTnDY=;
	t=1748247708; x=1749457308; b=T8sToZ3sH9mMQV3qqKQz+Mt805KsRLYSnezCuAjf7kvFJHL
	Y8Aoj7TNnMPQbJrcI7lGDuyNImOPKsCGJIJEe8sjG2QGVnE8UJ+SXzuARyMx52rlHXPfztWfpmHsK
	/FTanrBgfivQNLOix+t3LwO3whblFlmRuI//zghnr6OV3LPyTxsp1/bnAWARKbZndkJhgg/lzIT7K
	6r532pfYN8KHuWL1PoO15+329lQhaiswVCKUvLmc7MVfYBCevLPtUBoCTZw8nW0JKWxTia8umkyIe
	/pJqFBhgPdkwN+bnyWZ1DBNOqLqHiAAo1OmqV4DqLy4RfFfTJ28JCOY/OFVpJrQQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uJT5X-0000000DQMg-1YY7;
	Mon, 26 May 2025 10:21:39 +0200
Message-ID: <b36908bf35a20f7196bec4fe22e392a015d9b7d1.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ai Chao <aichao@kylinos.cn>, perex <perex@perex.cz>, tiwai
 <tiwai@suse.com>,  "kuninori.morimoto.gx"
 <kuninori.morimoto.gx@renesas.com>, lgirdwood <lgirdwood@gmail.com>,
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
Date: Mon, 26 May 2025 10:21:37 +0200
In-Reply-To: <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
	 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
	 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
	 <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
	 <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
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

On Mon, 2025-05-26 at 16:20 +0800, Ai Chao wrote:
> Hi Johannes:
> > > Hi Johannes:
> > >=20
> > > > > "simplifies the code" is no need to callof_node_put() .
> > > > Fair. Except that's not what you _actually_ changed here. Like I sa=
id,
> > > > either it's buggy before or after.
> > > >=20
> > > In the function i2sbus_probe, it not return a struct device_node, so =
, I
> > > think function for_each_child_of_node_scoped is better than
> > > for_each_child_of_node.
> > You still haven't explained why it's even correct.
> >=20
> > johannes
>=20
> The for_each_child_of_node() function is used to iterate over all child=
=20
> nodes of a device tree node.
> During each iteration, it retrieves a pointer to the child node via=20
> of_get_next_child() and automatically increments the node's reference=20
> count (of_node_get()).
> Each call to of_get_next_child() increases the reference count=20
> (refcount) of the returned child node, ensuring that the node is not=20
> freed while in use.
> for_each_child_of_node() increments the child node's reference count in=
=20
> each iteration but does not decrement it automatically.
> If of_node_put() is not called manually, the reference count will never=
=20
> reach zero, resulting in a memory leak of the node.

Yes, good! Now show that you can apply what you've learned to the
specific code (and changes) at hand.

johannes

