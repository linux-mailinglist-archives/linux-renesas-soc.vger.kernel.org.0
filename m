Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4022F3250
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 14:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730630AbhALN4V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 08:56:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:45864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726901AbhALN4U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 08:56:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D5EF22B30;
        Tue, 12 Jan 2021 13:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610459739;
        bh=EKrAC0Tw+nL4XMv/WuPU6vITqgesKFiVtHTkrfAfpSM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T25BP46HhPwtZiY7NSrzC0Z7zzJ0++WUQlf23zDqyFkIeAyLlo3NtpS8eyd98rVYQ
         C6aWL3efcorVYjH+136Y+7gHYAl0XR3k2LaDOxXdMe0Z06mzaSSobNVoSPp/HlMM9T
         425rjPE4taxuE9pw/xu9NA77qufwHugjp2uCuvxIxv2j6awjTu1C6UmUf8hbda6bpD
         v7PPBK1cPR1GR3rhQqv9/rbBDvtLzf+qjF/i1ufAwW6jxsP/Cyk+H4si/Lj2ELJwWV
         uTf5Hm1Cw6jQQbwtimxiTdsZo5gNLIvswGa3AUOFPgZmYk8G/RVWpHs7oOTDN+kFVO
         l5D2YnCK0cKPQ==
Date:   Tue, 12 Jan 2021 13:55:35 +0000
From:   Will Deacon <will@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: add grace period when rebooting
Message-ID: <20210112135534.GA9277@willie-the-truck>
References: <20201219143648.56217-1-wsa+renesas@sang-engineering.com>
 <20201219143648.56217-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201219143648.56217-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Dec 19, 2020 at 03:36:46PM +0100, Wolfram Sang wrote:
> I work on a system where I currently need to reboot via watchdog.
> Because the watchdog needs a bit of time to fire, add a grace period
> like on arm32 to avoid the false positive warning message.

Please can you elaborate a bit on the control flow here, specifically
from the part which arms the watchdog to how we end up in at the mdelay()?

Ideally, the mdelay() would live in some code that knows about the watchdog,
and therefore can choose the appropriate delay.

Thanks,

Will
