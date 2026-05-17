Return-Path: <linux-renesas-soc+bounces-32722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN6GFJWnCWrdjgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 May 2026 13:33:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6897560BD8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 May 2026 13:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 406A030067A5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 May 2026 11:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28AF32C94A;
	Sun, 17 May 2026 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usGFqiwb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC145405C5E;
	Sun, 17 May 2026 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779017618; cv=none; b=A4uYnh5eWeckCpeMwD+IRX7/Ztyb5HKCkxvt7sj/H9MaIYHs3KJBz540l0r28Gh7BHDz+IEQTlBQx2NNdurKb+UKxQxwNsV60TO2a44Xa0gqn3Hrf6Ftw9nFrj6YOIweq3ptOf/7+k4hh1A0fjOEzLZTW4DCkE+upvZ/uA9C/14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779017618; c=relaxed/simple;
	bh=yTYlVW3XNQ6KFLt3e4dKFe0LbjnsvoHG3Q/y/y1Hnk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UgIpQRO6QoeXWeqT4z1XZed3A4uYBCMiN6fU4dyiu+/xQ9xecFkgkf8mv4jkynC3cH2F1wW8bc0QjuIcSVCZkhOJ0nqp15OdB38a/8ca50hHNKWFqPveL/a4hYpwSOrIQ2MLEccCy+7Hb0mNhtOOIecytp06Zo/IO1KL5ATqKVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usGFqiwb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77964C2BCB0;
	Sun, 17 May 2026 11:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779017618;
	bh=yTYlVW3XNQ6KFLt3e4dKFe0LbjnsvoHG3Q/y/y1Hnk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=usGFqiwbn920YSSpla8jifwVPkQ2LQT22xTcHkRQK6clGMkA5A3ZozsuqGboqlD+D
	 rqEaFyACDlfeQwC58Y93/nOkVnwVs/a7bODfDRCVIiO4m/fBPt/S/kMlhY24gwrBGZ
	 RzpoJ32NMPa5Z9n9kn8kkHEvi01KKaj40kAYAKMnAc6ku/oDxsKH6GC9S3suCuDqcw
	 3iYFpSGVGrRX4r3O8g9ITlaEAtGfOMnu0ZC7jkMx6j5TP2VIp2/hZDd/nofwPFqSbE
	 j+xU1wXeeAJ9xJO1ulP3R+ilLfwfnpcJVvq2q+d9X+oW7ljk/8+Lmkmm4CGF00wo51
	 OBaBKtJPEQKMQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v4 00/15] SCMI Clock rates discovery rework
Date: Sun, 17 May 2026 12:33:21 +0100
Message-ID: <177901751519.3834262.16195066181334247381.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A6897560BD8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32722-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, 08 May 2026 16:32:45 +0100, Cristian Marussi wrote:
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).
> 
> This series aim at solving this in successive steps:
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[01/15] clk: scmi: Fix clock rate rounding
        https://git.kernel.org/sudeep.holla/c/d0c81a38d06d
[02/15] firmware: arm_scmi: Add clock determine_rate operation
        https://git.kernel.org/sudeep.holla/c/ecde921eb460
[03/15] clk: scmi: Use new determine_rate clock operation
        https://git.kernel.org/sudeep.holla/c/af86c99170b7
[04/15] firmware: arm_scmi: Simplify clock rates exposed interface
        https://git.kernel.org/sudeep.holla/c/0d76f62613ca
[05/15] clk: scmi: Use new simplified per-clock rate properties
        https://git.kernel.org/sudeep.holla/c/cdcd2fc94936
[06/15] firmware: arm_scmi: Drop unused clock rate interfaces
        https://git.kernel.org/sudeep.holla/c/2e757f71a5ab
[07/15] firmware: arm_scmi: Make clock rates allocation dynamic
        https://git.kernel.org/sudeep.holla/c/62ba967595e0
[08/15] firmware: arm_scmi: Harden clock parents discovery
        https://git.kernel.org/sudeep.holla/c/bda40491e0ce
[09/15] firmware: arm_scmi: Refactor iterators internal allocation
        https://git.kernel.org/sudeep.holla/c/e99ed7267263
[10/15] firmware: arm_scmi: Add bound iterators support
        https://git.kernel.org/sudeep.holla/c/4848d07ea9fc
[11/15] firmware: arm_scmi: Fix bound iterators returning too many items
        https://git.kernel.org/sudeep.holla/c/ae4a088f13de
[12/15] firmware: arm_scmi: Use proper iter_response_bound_cleanup() name
        https://git.kernel.org/sudeep.holla/c/3065e26dac52
[13/15] firmware: arm_scmi: Use bound iterators to minimize discovered rates
        https://git.kernel.org/sudeep.holla/c/26d04d592a47
[14/15] firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()
        https://git.kernel.org/sudeep.holla/c/4a07036d6159
[15/15] firmware: arm_scmi: Introduce all_rates_get clock operation
        https://git.kernel.org/sudeep.holla/c/d2488ff1a257
--
Regards,
Sudeep


