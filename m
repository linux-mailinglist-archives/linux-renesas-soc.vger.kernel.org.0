Return-Path: <linux-renesas-soc+bounces-19594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A62B0BB89
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jul 2025 05:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05DEB7A5662
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jul 2025 03:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48521FDE3D;
	Mon, 21 Jul 2025 03:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="QnWEapU1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2C78F5A;
	Mon, 21 Jul 2025 03:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753069947; cv=none; b=XeoPwLnuHhh4FA4MdWFP8PVCbjV2U0AW3PzG4L5twZyNUi66jBcD4n57t4ZCpMUOEghRVTzymT7dM97L3MtLj9hcgyoRTcmGa9DdGDvQJiAW3ir+5IcE7cEWItSj3pFR3xKWYQUmZo3GuhnygdBfUs2K2I5DK+V/njzvMl5uyn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753069947; c=relaxed/simple;
	bh=Iu+5IVXA6pbzC+y9EyJIaWB0KxreFLrxpLXUy3Xbk7I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XaVMUisE1Cv8eXv5UKvgJxAXZJYuAVz2sKZAi7Bg/6HISHSYnPSKMdrM5dNWfoRMc2f+3rX+R9+Fluo56BKKeWExCcq+QKCt/iWrpnn2L9W41P0AnrqO2Ji91RLmupUxYy12oJsn4154QY/eXrUuSUQAmyvR1ASpHcQVFF/E9r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=QnWEapU1; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753069943;
	bh=Iu+5IVXA6pbzC+y9EyJIaWB0KxreFLrxpLXUy3Xbk7I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QnWEapU1KJwFhPi0H8SqC7IGQ+rS4thZas19e+89eSgYus/fFo7Erw5lkQzWhGobp
	 sEfzpXqR5pqjHveRlUktHBPgi7nCjeZMLX7QWc1Re9+yKWEAKLiOd7MZd45aj27zD9
	 SpXgFop+4zsNrVblzmb6rJqd1Hambs4C8wy1GdX8RtGxkJ5wz/Z0TYG80bMMxPwGYH
	 ZIdFYsYy5XVilJBjqjFME/lGXZrrrb9I9VuZ4UdN4MZ4Bdn23+sJDAC8rrbW9s+v7f
	 LiMwLStxZOnNEQVxsvrRzWGMkbxy5LIYpQExqsR/sPzgWnGECjS6ComyetMO0oCTfK
	 Xihalh19KCsaQ==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7E777640A2;
	Mon, 21 Jul 2025 11:52:20 +0800 (AWST)
Message-ID: <c980c6c55f3a4914f1393498763bdf9cfb109ad2.camel@codeconstruct.com.au>
Subject: Re: [PATCH v8 2/2] ARM: dts: aspeed: clemente: add Meta Clemente BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,  "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
	bruce.jy.hung@fii-foxconn.com
Date: Mon, 21 Jul 2025 13:22:19 +0930
In-Reply-To: <20250717-add-support-for-meta-clemente-bmc-v8-2-2ff6afb36b0e@fii-foxconn.com>
References: 
	<20250717-add-support-for-meta-clemente-bmc-v8-0-2ff6afb36b0e@fii-foxconn.com>
	 <20250717-add-support-for-meta-clemente-bmc-v8-2-2ff6afb36b0e@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gVGh1LCAyMDI1LTA3LTE3IGF0IDIyOjU5ICswODAwLCBMZW8gV2FuZyB3cm90ZToKPiBGcm9t
OiBMZW8gV2FuZyA8bGVvLmp0LndhbmdAZ21haWwuY29tPgo+IAo+IEFkZCBsaW51eCBkZXZpY2Ug
dHJlZSBlbnRyeSBmb3IgTWV0YSBDbGVtZW50ZSBjb21wdXRlLXRyYXkKPiBCTUMgdXNpbmcgQVNU
MjYwMCBTb0MuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGVvIFdhbmcgPGxlby5qdC53YW5nQGdtYWls
LmNvbT4KPiAKClsuLi5dCgo+ICvCoMKgwqDCoMKgwqDCoH07Cj4gKwo+ICsvLyBQREIgVEVNUCBT
RU5TT1IKClRoaXMgY29tbWVudCBzaG91bGQgYmUgaW5kZW50ZWQgYXBwcm9wcmlhdGVseT8KCj4g
K8KgwqDCoMKgwqDCoMKgdGVtcGVyYXR1cmUtc2Vuc29yQDRlIHsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJ0aSx0bXAxMDc1IjsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmVnID0gPDB4NGU+Owo+ICvCoMKgwqDCoMKgwqDCoH07Cj4gCgpb
Li4uXQoKPiArCj4gKyZpMmMxMSB7Cj4gK8KgwqDCoMKgwqDCoMKgc3RhdHVzID0gIm9rYXkiOwo+
ICvCoMKgwqDCoMKgwqDCoGFzcGVlZCxlbmFibGUtYnl0ZTsKClRoaXMgaXMgbm90IGEgcHJvcGVy
dHkgc3BlY2lmaWVkIGluIGFueSBhY2NlcHRlZCBiaW5kaW5nLCBwbGVhc2UgZHJvcAppdC4KCiAg
IGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9hc3BlZWQtYm1jLWZhY2Vib29rLWNsZW1lbnRlLmR0
YjogaTJjQDYwMCAoYXNwZWVkLGFzdDI2MDAtaTJjLWJ1cyk6IFVuZXZhbHVhdGVkIHByb3BlcnRp
ZXMgYXJlIG5vdCBhbGxvd2VkICgnYXNwZWVkLGVuYWJsZS1ieXRlJyB3YXMgdW5leHBlY3RlZCkK
ICAgCWZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvaTJjL2Fz
cGVlZCxpMmMueWFtbCMKCj4gKwo+ICvCoMKgwqDCoMKgwqDCoHNzaWYtYm1jQDEwIHsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJzc2lmLWJtYyI7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDEwPjsKPiArwqDCoMKgwqDCoMKg
wqB9Owo+ICt9Owo+IAoKWy4uLl0KCj4gKwo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0
cy9hc3BlZWQvYXNwZWVkLWc2LXBpbmN0cmwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVl
ZC9hc3BlZWQtZzYtcGluY3RybC5kdHNpCj4gaW5kZXggMjg5NjY4ZjA1MWViNDI3MWFjNDhhZTNj
ZTliODI1ODc5MTE1NDhlZS4uNjFiMWQxYzUwNDBjODIwZjhjOTk1MTMyNzM5YmVjZGU4MGUwNjli
YiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQvYXNwZWVkLWc2LXBpbmN0
cmwuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9hc3BlZWQtZzYtcGluY3Ry
bC5kdHNpCj4gQEAgLTQxMiw2ICs0MTIsMTYgQEAgcGluY3RybF9tZGlvNF9kZWZhdWx0OiBtZGlv
NF9kZWZhdWx0IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdyb3VwcyA9ICJN
RElPNCI7Cj4gwqDCoMKgwqDCoMKgwqDCoH07Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqBwaW5jdHJs
X25jc2kzX2RlZmF1bHQ6IG5jc2kzX2RlZmF1bHQgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBmdW5jdGlvbiA9ICJSTUlJMyI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGdyb3VwcyA9ICJOQ1NJMyI7Cj4gK8KgwqDCoMKgwqDCoMKgfTsKPiArCj4gK8KgwqDCoMKg
wqDCoMKgcGluY3RybF9uY3NpNF9kZWZhdWx0OiBuY3NpNF9kZWZhdWx0IHsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZnVuY3Rpb24gPSAiUk1JSTQiOwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBncm91cHMgPSAiTkNTSTQiOwo+ICvCoMKgwqDCoMKgwqDCoH07Cj4g
KwoKQ2FuIHlvdSBwbGVhc2UgbWFrZSB0aGlzIGEgc2VwYXJhdGUgcGF0Y2g/CgpUaGFua3MsCgpB
bmRyZXcK


