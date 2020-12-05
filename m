Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFCAA2CFA85
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Dec 2020 09:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbgLEIHG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 5 Dec 2020 03:07:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:46802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726031AbgLEIHE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 5 Dec 2020 03:07:04 -0500
Date:   Sat, 5 Dec 2020 13:36:19 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607155584;
        bh=rqiDnzGnW9HWgQThLnWuKuocLnj2hdTK1JTmPXUDQzI=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=X3a4G/EfnwM1dSbTrhmIK4mD8wkjZHHcu+9fsUFv3VWKD9jbzMxFxZ1/KOFE3tjFV
         +vGZSEesNUsFvu9YJDs7j03f3CG9QR7gIHKfERUBnRJxfPl4iYTcYcFSzIw99Y/Uwo
         JJupr8wWup4hKgAsQQo8LvxXM57Hq1Z0phFLRT0RGwyz6PUZ3B4KEnWucAaV1Aoew6
         MCMEVWSazNNXUA/8GNKvLSTk0PMcJ63no45s3UE2fVuYaQp+e2xEKbWEiH/8jwgH7o
         0eVCA7+06AOIszVq535DlXNbcLkAO4OGuHeTRYxNnU9ukE/QthZsobZlmNND8eNWiF
         +60FjcWXuvZUQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Wang Li <wangli74@huawei.com>
Cc:     yoshihiro.shimoda.uh@renesas.com, kishon@ti.com,
        biju.das@bp.renesas.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] phy: renesas: rcar-gen3-usb2: disable runtime pm in
 case of failure
Message-ID: <20201205080619.GV8403@vkoul-mobl>
References: <20201126024412.4046845-1-wangli74@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126024412.4046845-1-wangli74@huawei.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 26-11-20, 10:44, Wang Li wrote:
> pm_runtime_enable() will decrease power disable depth. Thus a pairing
> increment is needed on the error handling path to keep it balanced.

Applied, thanks

-- 
~Vinod
