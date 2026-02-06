Return-Path: <linux-renesas-soc+bounces-28025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH3nKm12hmn/NQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Feb 2026 00:17:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7901041A8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Feb 2026 00:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 219EA3016726
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 23:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38C53033F5;
	Fri,  6 Feb 2026 23:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KiZUFbOX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C635CA6B;
	Fri,  6 Feb 2026 23:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770419816; cv=none; b=sexu6K+7xqv71hDNU3JsKwc7kdIy6YbpYcxAN8tJ4qbaKI72NYS4K0uHRveRtNgfbjRLeDEt/tEBkzJBkYmkGTKKVQ2ILmutZ4WYFxGObqCCRrtaaSTcLWfRNdAvxeQemAIO/Bm28wYFAIboO4fIXshZo4O1yCA5JNTXPB18JMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770419816; c=relaxed/simple;
	bh=oMK6mBtj4d/TlnVzBK54s7nUgIle1er383dnqSjiKqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTJ44MSUWR3h/7lUbpiDGymaxDZoBdmLT76V2n26g1R4+BONdh/teonS/v6vgQmV1QsBEqcwVLWFwBTeHLRWIxoI+NymhLC+FRwuHz+EsH2nb//y8joKYpFhRMl38x6RNfwXZIbDBqWweEmRe/SzDhhVEcewa6QViEAezDu97Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KiZUFbOX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B7AC116C6;
	Fri,  6 Feb 2026 23:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770419816;
	bh=oMK6mBtj4d/TlnVzBK54s7nUgIle1er383dnqSjiKqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KiZUFbOXfmx0h1XhS6eIJu5h7o5QNxhq2K0WRLJCJ9d8NFyFgv7sOHFvaH1s+ppAg
	 w1J9MfALy/S/h+UHiPbnU4MQ6umLqbSOGOZaSUCcsjpRS5w3KDAyl2S9g8zdyNVLO0
	 2d0FlUOu2Qm/43/nZP+YdYHnoXH404XZpw/1p2GhevZKgfXPP3xP7Y4OanpyFx3VAV
	 7fT6PWJKGsEPADnith13vjr4BJaC0xjuUz7pq5XFgTJ5uGXXKGFa8YN8h6y59mVo1m
	 w3NDqTCIyrkrNUa4MYAQrpp2h4FZR/OZly4HQsIki/3ivjHQWudaStK/WrV/C6HDze
	 KnCkbKcOrmMBQ==
Date: Fri, 6 Feb 2026 17:16:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v3 7/9] dt-bindings: arm: qcom: document the Ayaneo
 Pocket S2
Message-ID: <177041981220.409852.7101224387579712219.robh@kernel.org>
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
 <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-7-5b79c5d61a03@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-7-5b79c5d61a03@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,vger.kernel.org,glider.be,google.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-28025-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4C7901041A8
X-Rspamd-Action: no action


On Fri, 06 Feb 2026 15:50:35 +0100, Neil Armstrong wrote:
> Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


