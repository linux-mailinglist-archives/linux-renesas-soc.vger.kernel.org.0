Return-Path: <linux-renesas-soc+bounces-29095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFobK8OGr2lvaAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 03:49:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F02244683
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 03:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B73F304672A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 02:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E543B7B9D;
	Tue, 10 Mar 2026 02:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMl6zbYh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809163B52F0;
	Tue, 10 Mar 2026 02:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110875; cv=none; b=C0zkxJfGU662nVGUHemmOSHgruvDt9CW/6vOnqaXpJ4lTGsVNi0v6df4YR8rSN5FZJobPnEc6iPs2mUqy8kMuxUYXlVmla62h6kEa0qTqBRSIjDbLPuS1cpHwaPL+fhgcNB2fHcvxIo1FOvcd1QwRFaNRWKE/Bvh9vylRlzrZ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110875; c=relaxed/simple;
	bh=BKo2JFGh4kplY5MFn+IcKqJQRRu/T0/b339ikqxQuvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PFGRyToMK1sFDyPCi2LSIIGzYxUbMdQaT0/ba3iKOeSh5dfO2zOCPOPhNnHdXQphiZ3f+PQ2cGas1IYrM2jHYlIhJjDsf0qluiRu0MkJV+4sk2+dJDyxUsAlUxiJAVMVOrm/bcJKT30j7iYbN+LvLuMCw7xbuLnBhIVsfHJGnNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMl6zbYh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE8CC2BC9E;
	Tue, 10 Mar 2026 02:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110875;
	bh=BKo2JFGh4kplY5MFn+IcKqJQRRu/T0/b339ikqxQuvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fMl6zbYhNBfVs3GGGwD07EDTSNC/XNM69430TO34mWvpd/IHxceQOZAt7Hx5Auwsx
	 h8IYOddor3nkadLbXFw1VkXbzF31Wb1WW8tIIlLyWG6PTp+DDNARnLBsViMjRFuHyr
	 hJ6J21DXMzQaW6Q6mh53j+GVY5icXbfnm72wk8tMe3EFjghaINuQ3zOPNtioDfr8Az
	 JgcdshsUO8VUTiiJc7iclTkjIyy5p8TSKbn1sbIsDYznLMMdW7pPql0w1xT7jIoVO/
	 eKta3Mq4AW58R/i1SiiIRzEiDJtHAx8tzoi1RKWQ9nCIY4diWAL+uQ4IRwt1nNik2b
	 bJVUoCArde2Og==
From: Bjorn Andersson <andersson@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm/arm64: dts: qcom: Drop unused .dtsi
Date: Mon,  9 Mar 2026 21:45:42 -0500
Message-ID: <177311073300.23763.17399809586566365108.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212203226.458694-2-robh@kernel.org>
References: <20251212203226.458694-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 62F02244683
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29095-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Fri, 12 Dec 2025 14:32:08 -0600, Rob Herring (Arm) wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.
> 
> 

Applied, thanks!

[1/1] arm/arm64: dts: qcom: Drop unused .dtsi
      commit: 1701d886a193e2ce856e9c26ffe8db548aaa7694

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

