Return-Path: <linux-renesas-soc+bounces-21472-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E8FB456C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 13:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49AA67A7870
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 11:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0D634573D;
	Fri,  5 Sep 2025 11:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hDtYt328";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QRISs8Vq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7429E29B8F5;
	Fri,  5 Sep 2025 11:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757072646; cv=none; b=WbHBsFhLEo86u9CW9kl6WiOE4Y5SJLvbQ4wuDoZO2ikHmgnvHeYWHzcBNQR6VgmtmG31eOorNA1n4bCPQssIiKVD4aC1IlxZ9+nLTwTZG9CqZaPwfEMXBT5Yw76BlFeR39RrMs6xEgN8ur/fU+BGpXeCMGLKTK0Qs0c1Jkq31lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757072646; c=relaxed/simple;
	bh=YL6zKpPJxCVYaZ/oCgyC13gWf+2ueXc8Wnx9s5GwqNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=W5J68/MbuyplUoJ3a9a2RzdZBg0Ak4WCQ3In0SAgklIyT2Wtd9c0YLv19GJLkHI4hqgvLnZvuZdVruxnd2eLrgkf3NYwsR6ek9RIkexc+zo/ipGT42hHNnRNNQzNHckQoV2kieLxg6vvxQ8OMT0WoGFCjc9XGmbpRZ1VQ36C08U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hDtYt328; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QRISs8Vq; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cJDyN5zBbz9ttf;
	Fri,  5 Sep 2025 13:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757072636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m2Dk4rL1vEqekVW1M8NvOkpFPyRNDxfwkBtohMi9iV8=;
	b=hDtYt328Cp2I4nZ6kjdeQcmCPSRQZk2GSp2Shg7HuTdOGYNEvJVeoQCWf7py/A4e3QuGZS
	95OW60JmBtsH5xGfLrX2FZaIrAYCJPFEKPZrUDb0ueWiScogsIozkUbAEzzpNAp4HSXasy
	j3EGE1BfNFcOoZwsFlDjzNChwKqgsV3KonlWenVmlYtQYNDVoSj7ljy5v015MxeliJ7Nwt
	GW5WsnvgNTpxXyjwk6soO5XuGsoefjJk4rhCtND+4oybSK8YyeT2Aym5qwx68YUS97s0Wc
	5fSiBCVZeLrpR+z0iyjU9HMRKkrH+m08kpezA5vTb2RoagpOCNLcWlSfJTu21A==
Message-ID: <0c45d71f-d187-47b7-bdc9-f146bf740330@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757072634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m2Dk4rL1vEqekVW1M8NvOkpFPyRNDxfwkBtohMi9iV8=;
	b=QRISs8Vq+IWIeJEJsW4Gmc2+Qbi+/h03SBpcZWneJ5hvJaJN9STF1XVLavbEhRrgPHaAS2
	ZKJnoFFi6HF68Gyrz6Lu4xD9AvESYdPmvz+dSE/iaeMsHt3wawqhu9kOXhexW2kzT/Whti
	gY0xFKOD/Euj0b8S0cFLdwdDmnMpRQMHiND/3MLR1qdCgV97PLOBBxpD3ZwvCsce4DUFPe
	pWU//LwHD5QPjY3YAO9uV82rvKOg7smle787kR33R5MUfedFjEA1MKxkc2KO/mtwwgc1CI
	fgSCOxzkUfC971lQOSoGoTTXszSf3/kdgXz/8yLwj0z9qZaYrNtmq7zhMRWtzg==
Date: Fri, 5 Sep 2025 13:43:52 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/4] arm64: dts: renesas: sparrow-hawk: Add overlays
 for camera sensors
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20250905084050.310651-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250905084050.310651-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: hnk6dy4otdj5woua96a87iusce94d3ik
X-MBO-RS-ID: 24efc126920a7df24bc

On 9/5/25 10:40 AM, Niklas Söderlund wrote:
> Hello,
> 
> This series adds a couple of overlays to verify the two CSI-2 busses
> exposed on the V4H Sparrow Hawk board. The two busses are exposed on two
> connectors labeled J1 and J2 on the board.
> 
> The first set adds overlays for the IMX219 camera sensor, one for each
> connector (patch 1/4 and 2/4). A Raspberry Pi Camera Module 2 have been
> used to verify the proper operation of the overlays.
> 
> The second sets adds overlays for the IMX462 camera sensors, also one
> for each connector (patch 4/5 and 4/4). A DFM 36SX462-ML camera module
> have been used to verify the proper operation of the overlays.
> 
> The reason two sets of overlays are needed is that the IMX219 uses
> 2-lanes CSI-2 D-PHY bus, while the IMX462 uses a 4-lane CSI-2 D-PHY bus.
> To be able to properly test both situations on the board each sensor
> needs to be able to connected to each of the two external busses.
> 
> Obviously only one sensor can be connected to J1, and one to J2 at any
> given time.
> 
> See individual patches for changelog.
Series

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks !

