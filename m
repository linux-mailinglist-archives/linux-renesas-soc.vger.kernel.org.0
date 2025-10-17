Return-Path: <linux-renesas-soc+bounces-23192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B9641BE65E1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 07:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C988834EFAB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 05:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F03730BB83;
	Fri, 17 Oct 2025 05:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="OGM95IMB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2A910F2;
	Fri, 17 Oct 2025 05:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760677683; cv=none; b=N4aUsKn8V0/mjZtOCJNjnGfEVxcrydP+YD7eO9pFR/5RNAHg1FMJAvBf7DfAtoA2S/G91Dmzee/djd1Ks5Ed2pTM8vyxORsCdWqBXzvXlPxVzbgK93o5YeWpP9wf5CVFE4/wv8GHUusGzoLUKq/ILZOwN1qsW7bAtQsR4tQSo8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760677683; c=relaxed/simple;
	bh=lMKro1feHta3Ev1l0OElUNRw/Zk/TZv7q1l/O5EtEYo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U6BwtF5/qd9aEr5wxHb0TftmdkCT9KcLarCY+bCsaWXVJxGKxWpl6ATWltLSpeiQeFpu1MTljvgxj8bUxF2XvxzX+aC0ydjEfN+YT1+ENVtM0CzAXXeZGENNtPB93V3R8KcNL7QNaH6k8tD2rigOcAwy2vKcmvUiJ5YUCwBovAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=OGM95IMB; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760677679;
	bh=lMKro1feHta3Ev1l0OElUNRw/Zk/TZv7q1l/O5EtEYo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OGM95IMBtiyOqcKal/dEideDcepT9sptwo/Xw+NOzQRmzIeUAnshfynJtDxc/7ZjF
	 nMlpFLYjQf7BOPFIN6EM8iyvPrzAvcOoUEZfSv1dags2cyaDA8ARoVoWaqwLK/I6ma
	 GjKL6et/Lgff6UDz+wX3FwhCda7jyYx0SAkZSd1rPyVBIYYlk53HlSrEh3hOPq7xh3
	 JTT+ofoadN30UyYWhhUq8umhJwRwueq138SpWZ70fC5fS2KMpz6U04RIu6i+aLMczo
	 X36BvXTM9J+h/NjXtcQcJA2FeusqtxyNrgwMn6elhj4RzFxNdIkmgdAjVEiXAdcyMn
	 ZUolDo7r0o7mw==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 60FC0766F5;
	Fri, 17 Oct 2025 13:07:56 +0800 (AWST)
Message-ID: <a96786b9020ad278fbda8c2007ad1c98ca41a4a7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm	 <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
 Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, Leo
 Yang <Leo-Yang@quantatw.com>
Date: Fri, 17 Oct 2025 15:37:55 +1030
In-Reply-To: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
References: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-10-01 at 16:47 +0800, Kevin Tung wrote:
> Summary:
> Add device tree for the Meta (Facebook) Yosemite5 compute node,
> based on the AST2600 BMC.
>=20
> The Yosemite5 platform provides monitoring of voltages, power,
> temperatures, and other critical parameters across the motherboard,
> CXL board, E1.S expansion board, and NIC components. The BMC also
> logs relevant events and performs appropriate system actions in
> response to abnormal conditions.
>=20
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>

Thanks, I've applied this to the BMC tree.

Andrew

