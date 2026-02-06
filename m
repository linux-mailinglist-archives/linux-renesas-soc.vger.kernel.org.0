Return-Path: <linux-renesas-soc+bounces-28018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAJ6IFsEhmmyJAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 16:10:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF31FF7FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 16:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69F1E30137AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 15:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C8F279355;
	Fri,  6 Feb 2026 15:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtS2+Nxh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D700027603A;
	Fri,  6 Feb 2026 15:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390349; cv=none; b=We0dhDD8KU9wMsUdyYulJF1hBtCTDsgu1LMbFsyVcKJkirCLr2onL9c519Pa2zBjrd6qNuv7taitHfoIe5TwC07zxBmMhFYoyIT5Q5bP/0F9FtLiKUlrjbP7/Cz7dV+D2l2TGf8fQmB8Lev/ZiTVzk7R6HlK9wkHD6IhQTBOa0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390349; c=relaxed/simple;
	bh=RSB2OFRe/6/DcmzMzPHjQ+Zxxl5zXroyGePOEXEehJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmDqz7kSSCnKKMtHaYc7Jx19l3kd/qMXDIXFmVoJX6mh38D3e+M0g7h2V/lZmzSv8kasoD45yPptgxp6NhQcVSnsXqvtgCBitvBc7T9IKu7PMsfyr0SJd+dynM/bmn520SKyF4L/LpsXRiM+ylCytqQTPxHI5hk83Vawz4E66aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtS2+Nxh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D9CC19422;
	Fri,  6 Feb 2026 15:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770390349;
	bh=RSB2OFRe/6/DcmzMzPHjQ+Zxxl5zXroyGePOEXEehJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WtS2+Nxh55Adz0xYAf0PByzHQ6s6C/C9nq7MaYSOmHTfvsrH8peYshYKPMR1av/A1
	 bNtZxlPTieyMxfR/oUu5tYkKnM1Is7YF8E5Q93LLJOhVIjLIrIdEVROjTAsuWAy4y1
	 9YoxCQ0RJ2aWs9mpAH3fcLA4Bs9y6S80h01srWvaXtE64Aql6ya84wwWDzlQJCEeAA
	 +Z+DungMjosbrvE1frGGvt8dtQQymTMVYPUD1Yt110TpF2luyRzlCdXd1X5r+3att/
	 00dT60TBwiYTA5pZn848oEaCdRoJu43Or0HnQHzR7v8CMQhax8JYjn/CwmABdevwNK
	 OF6JMHeAFfEqA==
Date: Fri, 6 Feb 2026 09:05:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-usb@vger.kernel.org, linux-pci@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	freedreno@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	David Airlie <airlied@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sean Paul <sean@poorly.run>, Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 5/7] dt-bindings: arm: qcom: document the Ayaneo
 Pocket S2
Message-ID: <177039029875.225465.9560671235103288038.robh@kernel.org>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-5-c55ec1b5d8bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-5-c55ec1b5d8bf@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,somainline.org,vger.kernel.org,linux.dev,lists.freedesktop.org,linuxfoundation.org,gmail.com,google.com,oss.qualcomm.com,glider.be,poorly.run,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-28018-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: ECF31FF7FE
X-Rspamd-Action: no action


On Tue, 27 Jan 2026 10:57:32 +0100, Neil Armstrong wrote:
> Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


