Return-Path: <linux-renesas-soc+bounces-1-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 477127F22BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 02:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3BF12811CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 01:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1F717EA;
	Tue, 21 Nov 2023 01:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sD2Vh/b+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E622A17C5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 01:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDC9C433C8;
	Tue, 21 Nov 2023 01:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700528486;
	bh=WydedWHI5hgSzmjYaAgFcEvQrWisnvd0Tah1sl3VwoE=;
	h=Date:From:To:Subject:From;
	b=sD2Vh/b+WlZgBPcUwgWn2mqPn+nsFxtNUSNoaiGThbPVNK0Qo+mDfWDzvUlIu2ubw
	 I6x8V1kfZ3t/1IQiWsPVsVTvPmQYWDpaVj1cvhyKvzqIr/+apTnVoSQlACe4a8xoDU
	 MMtOVBHLOTPPNEeFdgPrp0BnQVoP1M/5Q5dOI7ls=
Date: Mon, 20 Nov 2023 20:01:25 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-renesas-soc@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231120-futuristic-terrier-of-realization-bc6bc1@nitro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to new vger infrastructure. No action is required
on your part and there should be no change in how you interact with this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K

