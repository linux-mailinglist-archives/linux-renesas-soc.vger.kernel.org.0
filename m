Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5622E1ED3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Dec 2020 16:50:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729095AbgLWPlY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Dec 2020 10:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729094AbgLWPlY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Dec 2020 10:41:24 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4113C061282
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Dec 2020 07:40:43 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id 91so19023410wrj.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Dec 2020 07:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MaasKCRffzpgJIsv9ZS58ZVtANtZw9D3YuGI24EnoRk=;
        b=V4DhD7ksO0QmeHWhje0vJbqSgsaBE4IhbygRi9luIJBHokyot5N2VmQi5Tc43w9uNA
         IJmoxooqSOcd0aFDIaConksC2vlk+4PLBUHe+isdf6JU+CGRPx4tSbPHznz8BtWOfU34
         DOT4xUR4oA+GswKFNRiThEGGmtuS2uO6gulRgHCY7GKtbmhCtNjgUI5O8ZbVn77toyB4
         IlqBAAuDB5kA232Fn7/8+paQFvYBxuIfbj4w3GSDNB5DLNcnzR9dRo4UNNhgRNR3KQzn
         FuX4QvgBmrGC53bsuegWuHf6VBll/faVjgY5vdU0gTYrmAZOpAHvY45rrx5FXH6RgLEb
         4W+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MaasKCRffzpgJIsv9ZS58ZVtANtZw9D3YuGI24EnoRk=;
        b=OGvhibFqA6v2X+WAVDYU0R5QkyXI5EHmiWjLgvbzWXDpf+OLDMrLjkiN0mZE35/6Fw
         Tj8BDZIhvO3vdOC6XN64mDm9rolHKoBPykVmPQaUEgSdtdgxbxpcOGewA3eiZSkBA5Oh
         X3YCWXBGI0ulQA1zitxz91IC/6Wnx+PEpo88I3+ToOMEhcHJL8QaTPYXsDMdCMxeEIZf
         j8jt+yU3+pgC69494cqtwcpv9VhMLKweVs/g7gwA3H81WyN++ImEufwazuCowEmWwbHj
         SRNr6TMJQWJSoqT0AB4fmzmaW7kt51Ai3hFjk9KnRSBkwa99YF0Nl65yM+hailS4QPWP
         SzuQ==
X-Gm-Message-State: AOAM532M7EHz+n3CLMs9pWx2vxa73SrJfXnsY4n1i6dwH2r2CAU94zKH
        t1LALCKnZBRk9bHufSQdNgcqdA==
X-Google-Smtp-Source: ABdhPJwsm6rpQpwFXUJAOgKiT+pcDnsVjvWAL78BjVFBjIMwy7/Ip7nETfrrRZCiR1ZdKZWaHCzbFw==
X-Received: by 2002:adf:e452:: with SMTP id t18mr28767589wrm.177.1608738042440;
        Wed, 23 Dec 2020 07:40:42 -0800 (PST)
Received: from dell ([91.110.221.175])
        by smtp.gmail.com with ESMTPSA id f9sm39630956wrw.81.2020.12.23.07.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 07:40:41 -0800 (PST)
Date:   Wed, 23 Dec 2020 15:40:39 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     marek.vasut+renesas@gmail.com, matti.vaittinen@fi.rohmeurope.com,
        lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, khiem.nguyen.xt@renesas.com,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Message-ID: <20201223154039.GB681741@dell>
References: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608718963-21818-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1608718963-21818-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 23 Dec 2020, Yoshihiro Shimoda wrote:

> From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> 
> The new PMIC BD9574MWF inherits features from BD9571MWV.
> Add the support of new PMIC to existing bd9571mwv driver.
> 
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/mfd/bd9571mwv.c       | 80 ++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/mfd/bd9571mwv.h | 17 +++++++--
>  2 files changed, 93 insertions(+), 4 deletions(-)

Once you've taking mfd_cells out of ddata:

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
