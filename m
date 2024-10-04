Return-Path: <linux-renesas-soc+bounces-9458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 596F7990A54
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 19:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C6941C219F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7671DACA0;
	Fri,  4 Oct 2024 17:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GuJeGZP5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IXQnpQPA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018DB1E3784;
	Fri,  4 Oct 2024 17:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728063820; cv=none; b=ZQ3VgMv/m291LKwz/UMnLCGmaTLbqPmJjEQrA5rMgHLEKGgVb3cqsmKmD+K5c9rpBr0KCeJ8qoTlH5WlcYB45kLqQ3BGHj0VARmoE35+v16c3tyPn4KWZggFeudO/nmtwyXQw5aV07YLsseAuFg8KYKdQGEced52IXZbKgn/l50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728063820; c=relaxed/simple;
	bh=SrIcmX5LERTV9UXiF5F0eUpH4un7emPqixCnfdUsWic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiutdCKUFcOjUBkOvZurt6oYBLKu/kSP/40+FHxYFcXM0XU/ewhg6JKrEravZppOzsvnhfkxrPI/pL9LbOVl42/BZl0iSGUpggf3g+ltHAQlgNCC8CveD0f0tiZREfqgVqJ3p/mBTzKByp8ZL2fRkPzS1lkF4RX4k+RVbXXcQIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GuJeGZP5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IXQnpQPA; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 06ED411401C4;
	Fri,  4 Oct 2024 13:43:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 04 Oct 2024 13:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728063818;
	 x=1728150218; bh=6xywjibh/G02zJk+kwDiDMIM9D5UhTi5w32W2su72dk=; b=
	GuJeGZP5IMyAZ1KX1XcOKGtmqw9h+fCnRwC32Kk1OqEORGFbaj7CSDoS8+QC8rp1
	AjT0A7+Tz8+XMqUadqwmNI4sjLQm+B1agZZZh1X9417rgy4aPROnkt2rdQqV3jFA
	QnEd2KHzwRR54n4DL7K+GgPtJ10Omdjb7Q58wOWbw28HM87q+vxNr4CpwBTG8pK2
	wqTLD8v+Uwrnf0FseUia/hitCFyukRegHuJlyqoAgcAvroroBezguA3CeDLy+bpZ
	jwWYNUHLNqTNl5h9mTC3pY/VIe3Wt2kDKaXmo8nqniNqr4GfyoFo2X0nMppzpB/o
	cfgJYBwxR9Zrm3TBKl6mcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728063818; x=
	1728150218; bh=6xywjibh/G02zJk+kwDiDMIM9D5UhTi5w32W2su72dk=; b=I
	XQnpQPACUxKLpJisr6ecb9+YMlS4pgNxyi2OZ+MlCWAigBnG1pCqAaAC5xNn5k7K
	2kBu8ntZuWEeiA43RUWSYPQWDhykqRVW9nFSUUEZ3CMpZhhtNesQYi/n4x28rLrG
	T0NYrNa9jYNMgexCV2YjY0/OX38zNHf9J228SqyfTxfcMmzJfs1ElxJ3sey8r+39
	dSvsIC12Ce0Xd562kkD/bFBO2TNq9X21up21gRc8A/hFQD4dwR4wBXN/VZA/1E+z
	3MCdrx5SfSLqUPr5bVFXQBijVLgjyRO7RoICmLomnAnzSGQ/dSRMfnupS+EvcXug
	tjKrUlQ/+J/4fW9GsrAVA==
X-ME-Sender: <xms:SSkAZ2yWycBqlZjFkEGqBrHC-zUndloZWUQEA2NBkJPxsyLi9jt1CA>
    <xme:SSkAZyQwgM49Kx9-aDNxnbsnmB_IHNRRv7UT1l2IpInNXXmvTIDw3xXqRHium6Xdo
    1lwYRulNnkmYGGf44o>
X-ME-Received: <xmr:SSkAZ4UvZahzZwgKEf1H1f8YNzSSGsRVSMNL4T9pYn8zFRPAJbkAXNRet3iTPfIhK4oOI480JXtSMSaC7ub0GZ4InQSN7JMIrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepiedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhl
    ihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhi
    nhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgv
    lheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeguvghvihgtvg
    htrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:SSkAZ8glRgUImLMW9VKXj6sfeNdkTecn1Nb1hYNrxNjGXIuuAMapkg>
    <xmx:SSkAZ4CKc8VPa4kh-tAY3k3gL6J5sIQyvEQhJ1WmJHFf_jvTETFlqw>
    <xmx:SSkAZ9KUhw8o2lamhhufMnSKKSbpetSklf94BvcHRik2xDKtvaSxnQ>
    <xmx:SSkAZ_CapCzo6f5UYC0hfB_9IXJNcG-r1WuUjtbqLUIJRolefO1Kkw>
    <xmx:SSkAZ61uudr4tTTZg-34LUEed1LP0eMSgabhDEPVbcx0mZaGVQ2WzJyJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 13:43:37 -0400 (EDT)
Date: Fri, 4 Oct 2024 19:43:35 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 20/20] arm64: dts: renesas: rzg3s-smarc: Use
 interrupts-extended for gpio-keys
Message-ID: <20241004174335.GK3542504@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <6214cd8ed068e3fc60a7b972093e4d99cdc0be1a.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6214cd8ed068e3fc60a7b972093e4d99cdc0be1a.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:53:02 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> index 7945d44e6ee159f4..4509151344c430de 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> @@ -20,8 +20,7 @@ keys {
>  		compatible = "gpio-keys";
>  
>  		key-1 {
> -			interrupts = <RZG2L_GPIO(18, 0) IRQ_TYPE_EDGE_FALLING>;
> -			interrupt-parent = <&pinctrl>;
> +			interrupts-extended = <&pinctrl RZG2L_GPIO(18, 0) IRQ_TYPE_EDGE_FALLING>;
>  			linux,code = <KEY_1>;
>  			label = "USER_SW1";
>  			wakeup-source;
> @@ -29,8 +28,7 @@ key-1 {
>  		};
>  
>  		key-2 {
> -			interrupts = <RZG2L_GPIO(0, 1) IRQ_TYPE_EDGE_FALLING>;
> -			interrupt-parent = <&pinctrl>;
> +			interrupts-extended = <&pinctrl RZG2L_GPIO(0, 1) IRQ_TYPE_EDGE_FALLING>;
>  			linux,code = <KEY_2>;
>  			label = "USER_SW2";
>  			wakeup-source;
> @@ -38,8 +36,7 @@ key-2 {
>  		};
>  
>  		key-3 {
> -			interrupts = <RZG2L_GPIO(0, 3) IRQ_TYPE_EDGE_FALLING>;
> -			interrupt-parent = <&pinctrl>;
> +			interrupts-extended = <&pinctrl RZG2L_GPIO(0, 3) IRQ_TYPE_EDGE_FALLING>;
>  			linux,code = <KEY_3>;
>  			label = "USER_SW3";
>  			wakeup-source;
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

