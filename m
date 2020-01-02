Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B19EF12E769
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2020 15:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgABOwt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Jan 2020 09:52:49 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:39335 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728528AbgABOwt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Jan 2020 09:52:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=OAnAY2vaA2S1dqxbsSKJAdvKdXR2aLsZd3RWqY191tg=; b=FizrheWOtuPgPxIwSY3pmaukdy
        qcfrcCXhyJ6PVkypQHNu5mFvM7XrDvPEzrrRKiP03hLsAO4G2L1HMc04Cs+33YWU69ig1HQEq7GYE
        VgAE5hlIs5s8Bb8B/SejLyUKV9MSeAKRNv9ip9q67BqI4tJ1kitg6OfFn91jLhphnhaAwjApOmuLc
        QY8lCXBNPPyLLstZX7rFpVPgvJHZMfZXrTF1X1uJQ2bhns7A9fXy+RNa0g/SPaBTyaREIBafz/D0v
        WPZceY2kEttZHY9NJvwcmHtHspH8Z+nSnudItDpyH92lAGSCTWE4ujempd9WWAn+juyKvfcmVH8C9
        aDSiBFUQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57723 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1in1qA-0005O0-Jf; Thu, 02 Jan 2020 15:52:46 +0100
Subject: Re: [PATCH] drm/mipi_dbi: Fix off-by-one bugs in mipi_dbi_blank()
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Thierry Reding <treding@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191230130604.31006-1-geert+renesas@glider.be>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <4702e72d-b452-2f87-6c5c-f46321eb071a@tronnes.org>
Date:   Thu, 2 Jan 2020 15:52:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191230130604.31006-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



Den 30.12.2019 14.06, skrev Geert Uytterhoeven:
> When configuring the frame memory window, the last column and row
> numbers are written to the column resp. page address registers.  These
> numbers are thus one less than the actual window width resp. height.
> 
> While this is handled correctly in mipi_dbi_fb_dirty() since commit
> 03ceb1c8dfd1e293 ("drm/tinydrm: Fix setting of the column/page end
> addresses."), it is not in mipi_dbi_blank().  The latter still forgets
> to subtract one when calculating the most significant bytes of the
> column and row numbers, thus programming wrong values when the display
> width or height is a multiple of 256.
> 
> Fixes: 02dd95fe31693626 ("drm/tinydrm: Add MIPI DBI support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Thanks, applied to drm-misc-next.

Noralf.
