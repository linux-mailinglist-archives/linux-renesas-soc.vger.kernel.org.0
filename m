Return-Path: <linux-renesas-soc+bounces-30127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPF2Dg+VwWnuTwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 20:31:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CF02FC4F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 20:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2619C30224EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 19:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B063612E0;
	Mon, 23 Mar 2026 19:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWf6Eotg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B983D6461;
	Mon, 23 Mar 2026 19:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774294279; cv=none; b=ghZul28a8KrVeE12VGe6E1k/YqMsFgXefM8E9rENhXnpwPN/U7YA/qdii0BL8OOsYpCCYPIX1MPY3VBQFkn2nQa8UdLWUeHfagwJQ4XB/TjO4JIUMqdjOogWSC+d+2URv/Zj4DuD0DNEboiVfBPic7usZdvB3ctGGiPmWYUDCNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774294279; c=relaxed/simple;
	bh=G20CxqU1+UGW3jMquGn0Ml5GLP9YQQvV4BfT9lF/heQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUePBjPfbHnA8iYSuq0pYlzjqnF+81GaryQcWYq1WTxym3Q1AuxUbyc8kEh1HQLJLISmJ0k0R8cYEyt/ZW5GEA1aZ6UR59RaBFM4blRRubxCrWef8JeIUIckOQSgB/CFYBzcuqopIYvkWITfCDLfUKUM/gdvXPZemLcKqJm9JqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWf6Eotg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87749C4CEF7;
	Mon, 23 Mar 2026 19:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774294278;
	bh=G20CxqU1+UGW3jMquGn0Ml5GLP9YQQvV4BfT9lF/heQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oWf6EotghHJ94y6XisVtCSIuaWRU8U5SBKQ+Npd/0KQlToN9cqxLPMA0o2DeGQKTx
	 md9aNoSqff3bF6SGoQTvkKqdc7g7tbzMwH2s4+9fFylyjwURmXWgId5Xeq1DbdNtOE
	 3MB+rggjxUuKC09Rb52v9AMu8UdxMOBkDSyR4t+myYDxc6jHNMEf1fmQ2R7iCpE4sP
	 i4RmpOIBogJkmRHW8ekq+HVgCu8nJLghIkSdwLwkgeDM4fGfBde5NEAL/NL3u0Te3o
	 Wo/chRxpvRHaBOGZ6nWKbrtx92AKHIrdXTJZrSObmnU/TMeRI6v1WiBhp2feePJTBE
	 Nx81EpcyHdYLA==
Date: Mon, 23 Mar 2026 14:31:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Artur Weber <aweber.kernel@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Simona Vetter <simona@ffwll.ch>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2] dt-bindings: display: panel: Align style of "true"
 properties
Message-ID: <177429427708.1201655.1282560740114518028.robh@kernel.org>
References: <20260313-dt-bindings-display-panel-clean-v2-1-d49615218f92@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-dt-bindings-display-panel-clean-v2-1-d49615218f92@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,linaro.org,ffwll.ch,ideasonboard.com,lists.freedesktop.org,suse.de,ti.com];
	TAGGED_FROM(0.00)[bounces-30127-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,msgid.link:url]
X-Rspamd-Queue-Id: D6CF02FC4F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 13 Mar 2026 09:20:54 +0100, Krzysztof Kozlowski wrote:
> For code readability, several bindings which list allowed properties
> with ": true" syntax group them in one place, without line breaks
> between each.  Align a few bindings to match this style.  No functional
> impact.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop applied patches 1-4
> - Rebase (jadard,jd9365da-h3.yaml change is gone)
> - Link to v1: https://patch.msgid.link/20260306-dt-bindings-display-panel-clean-v1-0-3086eda1efaf@oss.qualcomm.com
> 
> BR,
> Krzysztof
> ---
>  .../devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml | 1 -
>  Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml  | 3 ---
>  .../devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml    | 1 +
>  .../devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml    | 1 +
>  .../devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml    | 5 ++---
>  .../devicetree/bindings/display/panel/novatek,nt35510.yaml         | 3 ++-
>  .../devicetree/bindings/display/panel/renesas,r61307.yaml          | 3 +--
>  .../devicetree/bindings/display/panel/renesas,r69328.yaml          | 1 -
>  .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml    | 5 ++---
>  .../bindings/display/panel/sony,tulip-truly-nt35521.yaml           | 2 --
>  .../devicetree/bindings/display/panel/startek,kd070fhfid015.yaml   | 7 ++-----
>  11 files changed, 11 insertions(+), 21 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


