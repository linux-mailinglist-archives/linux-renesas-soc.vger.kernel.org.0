Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 376AE736E03
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jun 2023 15:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbjFTN4w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jun 2023 09:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbjFTN4v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2023 09:56:51 -0400
Received: from s.wrqvtbkv.outbound-mail.sendgrid.net (s.wrqvtbkv.outbound-mail.sendgrid.net [149.72.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85595CF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jun 2023 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=mime-version:subject:references:from:in-reply-to:to:cc:content-type:
        content-transfer-encoding:cc:content-type:from:subject:to;
        s=s1; bh=9grUNdjpwqcccJBDhf97I+CcaImjeCFFPj4g4gaFuZI=;
        b=Ja+cPrGU74pYP/PEoZNoGXjNhsM5CxymvSf6Z9demJvbei59nawZEY7OSrrKftzqd/RI
        0e9RJeil6W7IdF871oQdxyi6QPHu0SIoJHjUNtpiYYRhPqVu5SK8b8pfwF5SSxXYuFF7q2
        tPS3dCNQJsU0VNe7voHO8nXpVm8zLNOFnUqe4EP4B6TQVo8a5lBJz7u7bP71pwzscczTjJ
        rknChUUSWeCiX6f60EdPq+mf06MbfsbMDkyF7ziqO0UdLs0bWN3rQmuB+nwpm6iD08RH15
        0/y205azE1XRhv6Gb+R7wvqdxMTZ8gaNgfCzT14T8tKMOTEDQf6V/i+kOp8J2eJA==
Received: by filterdrecv-84b96456cb-jnxmg with SMTP id filterdrecv-84b96456cb-jnxmg-1-6491B000-11
        2023-06-20 13:56:16.489152857 +0000 UTC m=+3507455.908062499
Received: from [192.168.1.50] (unknown)
        by geopod-ismtpd-9 (SG) with ESMTP
        id yRlPZ-tUSQOW3d5KxRVAdg
        Tue, 20 Jun 2023 13:56:16.135 +0000 (UTC)
Message-ID: <34c08fc9-eb9b-376d-57fb-d47a68c2fc4d@kwiboo.se>
Date:   Tue, 20 Jun 2023 13:56:16 +0000 (UTC)
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] drm/rockchip: Resolve dependency in GEM DMA helpers
Content-Language: en-US
References: <20230620121202.28263-1-tzimmermann@suse.de>
 <20230620121202.28263-3-tzimmermann@suse.de>
From:   Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20230620121202.28263-3-tzimmermann@suse.de>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h584SJKyuyhG0hFts?=
 =?us-ascii?Q?c+ciLuROhOoYSR1iWZ7yKcZEhmAlMelTfRjOp7s?=
 =?us-ascii?Q?IRhf554NLzeDvXtYeCMp2cTjVytqzvig0bprfqC?=
 =?us-ascii?Q?WbAftpv=2F0pKjP6TLTkEc20WXab3bZFv8GtrSUK7?=
 =?us-ascii?Q?HTIWEPsFlMPAgD5cUadwhf5XhKTnXCrfbxRRf3k?=
 =?us-ascii?Q?KL+3kSNd1mpgirjm91aTQ=3D=3D?=
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
        heiko@sntech.de
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org
X-Entity-ID: P7KYpSJvGCELWjBME/J5tg==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Thomas,

On 2023-06-20 14:03, Thomas Zimmermann wrote:
> Remove the dependency on the GEM DMA helper library. Rockchip comes
> with its own implementation of the GEM interface. It only uses the VM
> callbacks in drm_gem_dma_vm_ops from the GEM DMA helpers. These are
> not DMA specific.
> 
> Duplicate drm_gem_dma_vm_ops in rockchip and remove all dependencies on
> the GEM DMA helper library.

I have intentions to remove the entire custom implementation of the GEM
interface and replace it with use of GEM DMA helpers in a future series.

Current custom implementation break import of video framebuffers located
in memory beyond 4GB. Switching to use pure GEM DMA helpers solved that
issue but requires reworking IOMMU integration for full support of
multiple VOPs on e.g., RK3288 and RK3399.

I have no ETA on when such series can be ready so this is more of a
heads up that I will revert this removal of dependency on GEM DMA helper
library in a future series.

Regards,
Jonas

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/rockchip/Kconfig            | 1 -
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 8 ++++++--
>  3 files changed, 7 insertions(+), 4 deletions(-)
> 
[snip]
