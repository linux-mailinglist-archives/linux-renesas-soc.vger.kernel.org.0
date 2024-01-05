Return-Path: <linux-renesas-soc+bounces-1324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0122482513F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 10:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 982991F21DF5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 09:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC2B249F3;
	Fri,  5 Jan 2024 09:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b="fOW+CbyD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE252421D;
	Fri,  5 Jan 2024 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arinc9.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB8951BF20B;
	Fri,  5 Jan 2024 09:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1704448406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c1smSdFUUoGTVbLI9RudSH/ZLZeLcfnze4E2cDMPwTk=;
	b=fOW+CbyD2Euiziw76hAYS53Tn7XRVPRm6ZPU8JqHaFD/RFVeCQPWQdcLNlPC8AXQxH2ake
	oWHfTOfXewOOYeYDXou/hFOo6ZycX81ZYsazW5urxAwT+93PaK3yhUDZxLbB6biflRy/Re
	kP2HYqXqTwhs6GfhRx43XMLbJD8FdY4jGWhbTvLHkHuAYlBASo2JFTTipe5vFmEXHu21Ft
	KwX1D6w4YLWtdvVMP9Li0f5mF+Ga6a+gpeAhhHlhKbTcEKVat1GHfeE5dfIZN9eOW9VC3X
	D23izcmdEGV5Jrr1Dr766+XtwuEEvrGE0+aSd2OVpTCaIR607o772eB7sJqilQ==
Message-ID: <987d17d0-c71e-4f81-b764-c6e3251ed057@arinc9.com>
Date: Fri, 5 Jan 2024 12:53:19 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: fill in MODULE_DESCRIPTION()s for DSA tags
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, hauke@hauke-m.de,
 kurt@linutronix.de, woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
 daniel@makrotopia.org, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, claudiu.manoil@nxp.com,
 alexandre.belloni@bootlin.com, clement.leger@bootlin.com,
 george.mccollister@gmail.com, linux-renesas-soc@vger.kernel.org
References: <20240104143759.1318137-1-kuba@kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240104143759.1318137-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com

On 4.01.2024 17:37, Jakub Kicinski wrote:
> W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
> Add descriptions to all the DSA tag modules.
> 
> The descriptions are copy/pasted Kconfig names, with s/^Tag/DSA tag/.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

