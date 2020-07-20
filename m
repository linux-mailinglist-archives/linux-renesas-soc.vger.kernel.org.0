Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABDEC2257A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jul 2020 08:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgGTGeB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jul 2020 02:34:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:50440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725805AbgGTGeA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 02:34:00 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D6FE21775;
        Mon, 20 Jul 2020 06:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595226840;
        bh=ZwOeL3EPgtxnw9BleSgHpslrspXGbH6eZ9G5FUI9tNI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uLi390TykNl3+X/IzwX6uYWWyFfmdB/yK++H3Yb8EF2QDrxBB8NxGJRddyZrHve3U
         W4S/i4ojU6STz9UX2p2HufluJHs6oQCjowBhfLO28jAm6CGtOES1/bnigmZaRg+JUo
         XALHEvdS+mgaApCcPDcaYbh5Hi/JeKWXDKQlso+s=
Date:   Mon, 20 Jul 2020 12:03:56 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     kishon@ti.com, wsa+renesas@sang-engineering.com,
        geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] phy: renesas: rcar-gen3-usb2: fix an issue and
 minor update
Message-ID: <20200720063356.GD12965@vkoul-mobl>
References: <1594986297-12434-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594986297-12434-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 17-07-20, 20:44, Yoshihiro Shimoda wrote:
> The patch 1 can fix an issue which SError happen if CONFIG_DEBUG_SHIRQ
> is enabled.
> The patch 2 is a incremental patch from patch 1. It's better to avoid
> unexpected behaviors if request_irq() failed.

Applied, thanks

-- 
~Vinod
