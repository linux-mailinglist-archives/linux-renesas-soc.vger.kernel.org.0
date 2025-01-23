Return-Path: <linux-renesas-soc+bounces-12436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B769A1ABC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 22:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 078B33A956A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 21:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D431BBBC8;
	Thu, 23 Jan 2025 21:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WvQNHbq4";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HDwg+Etb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB713DBB6;
	Thu, 23 Jan 2025 21:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737667051; cv=none; b=HrO102bHKyIgAuQTOKZgvlbqkWj6ICmV4uAFB0ruNwDGX2RSmsO3cgfiKSMzvZcUFftu5Qn8Aym4ME1kzzxofEHPctThG4ig3E14luP9JGCdLf3F6r9GenW5rmplPjMj2aTu388G//iq3UTisqX/8pwpN6b7IoxGHtSKk9KKhjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737667051; c=relaxed/simple;
	bh=ij6YPi0fMQsR5o3k6dZLhcRxewzxjEDuIFT5dygceCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hx/cbaPYf+SYq01Ci5Q9pWcPvoranIVvK9IJdh2S4v7/2AkGRAGBNYMHy+lcQCjlyEm0EnMnBD8qeKJlnBAl6uAJKCsvQ5oKvaz2XNsb6ZEx8Xd5YXCJajqr6dAp16s7nlmMAh3PKrz3Ts4smFmWWavhOlGocymZFSk8uBzPbR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WvQNHbq4; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HDwg+Etb; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YfDKr5kypz9shx;
	Thu, 23 Jan 2025 22:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737667040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0s0TZa+/AGyLnRciIIQJMh70Ve7Kbe0zJYWKJjLqkb8=;
	b=WvQNHbq4j8rQgx3062nPCIrAGnJAfSO0aiZVO+VH8YQ6cJR+o1tOO2q/vDaooICbfPaWIn
	MItViy4l/9XMuPURQtf4gIiPfpCX1iJOzaQ1zYi0u40qHovH5CVu5UGfdgdTZv45OOsSnT
	NWAkGg6trRpCCkdPexD9NYQ0WAqIBjB8tCnCiOXQtP/we8JHBkEGIDsTwpfe+C0J9BpV8r
	Eo1BUm8+i+5/a8E5KE90H+z/jZWnIsGmoiRlwvZcdsQqkk9kQ/ej29ygsStWPC9xwsFKNc
	wzreymoFF+h2YzBh807jFEcRIEelWXBKZeK/Z34eYGWegM60yMXUJr1efcQEgA==
Message-ID: <9e67bdc3-2cc0-4aa4-90bc-252b9771b7c5@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737667038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0s0TZa+/AGyLnRciIIQJMh70Ve7Kbe0zJYWKJjLqkb8=;
	b=HDwg+EtbMOzheeMO5hhIMqvOUVG4e7dkBGsK+yC7cko0KGXTFXI7BMl3owDF1wilH6dBsC
	OPUA/9XKaDEH/HuwMs0QR8dXyGwNx0LoH62Y638+j9Y3+7+fFzVw+VgvqsHPQYERz0Yb2x
	SPezR6aSj6O5Gk8L2DEtjOTN/4S7l6knR99eS98xHJ/C4X62N4W/NYnSRC+ZEEwui/qyN7
	qIFSyzB11PDLhQwMj2cFeVVAI0ot1+G4g6b/yHy0bijGzJWTkvVmsRWZCrpIO+mei0od5H
	bvFpC7n/nKT+oza18QtDduh4Naw1SsBAUsHkvNumGvlFcCNs8wSh5vq3ZLeVdQ==
Date: Thu, 23 Jan 2025 22:17:15 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: Disable rswitch ports by
 default
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <c4688de8e3289ad82c2cd85f0893eac660ac8890.1737649969.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <c4688de8e3289ad82c2cd85f0893eac660ac8890.1737649969.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: afqnogrz6g1bge85jhodgssiuee7ym7r
X-MBO-RS-ID: cbbdb80942174f9b945

On 1/23/25 5:37 PM, Geert Uytterhoeven wrote:
> The Renesas Ethernet Switch has three independent ports.  Each port can
> act as a separate interface, and can be enabled or disabled
> independently.  Currently all ports are enabled by default, hence board
> DTS files that enable the switch must disable all unused ports
> explicitly.
> 
> Disable all ports by default, and explicitly enable ports that are used,
> next to their configuration.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is similar to how Ethernet switch ports are handled on RZ/N1D, and
> CAN-FD channels on R-Car Gen3/4.
> 
> If accepted, I'm wondering if I should move it forward, before "[PATCH
> 3/5] arm64: dts: renesas: s4sk: Access rswitch ports via phandles"[1],
> which would become slightly simpler.
> 
> [1] https://lore.kernel.org/all/20250118111344.361617-3-marek.vasut+renesas@mailbox.org
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

I don't mind either ordering, but please keep in mind that 5/5 in [1] 
has Fixes: tag and it is already overloading that tag by pulling in most 
of the series as dependencies .

