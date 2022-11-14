Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA8BB6275DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 07:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235493AbiKNGT5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 01:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbiKNGTz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 01:19:55 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBCB9AE53
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Nov 2022 22:19:54 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id w23so2747021ply.12
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Nov 2022 22:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qsw5Lak96/1gpYbt2tz5xOdeqxoFbfii0SlW21VQV9g=;
        b=Qy2yL8Zuk00rkfId+O+FbpDk7EwuuZNfnTEH5YghgY4cX5gcKf0ubfdz0937L2vWsO
         R0AmmzclNsv37s2g4WitX+9NWqpBP7jN2UOaP+6uUVdveshAYr1Z1mhA7FO667HGxFXw
         6ZQ9pnnkATbikScOTjXU/A9RNC7wRQzSDqxbCVvenLSyNNdfrGxRJdMsaa68GJ+2P82U
         dsp0jgnjJTNlaCl8QSVTYLa2u6k080XXuTnp5IInUQ0DIAnsNj1vk3ivItWXzKhKj+wC
         Z9AASkGIvmfr2RJmezfiHynRDvC6daLkG8yGL+bzkywtSDNrtldiv52LDoEIKTZIwIjI
         vl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsw5Lak96/1gpYbt2tz5xOdeqxoFbfii0SlW21VQV9g=;
        b=5nPRV60FdwQawtXZ7wqwzcODkTApMMu8bM+mp6HIm5szvzY6emsycIULMUCYF8U1Q0
         PaMFtCXPs34vTeRHlfW0zrzugLPeg4B4nluR5IKUmRTgHoaxTD1vdH0h/qnOgKYv88w7
         YbbPMEA0e4sHYbMLujkraN3Sf8Zyo6lCs93p94MSk+Dwd6xrEXTQ9gzQmYtiNku2rMd3
         gmEbZNXVdOZmQiWFxzRLsR3mJCtligoI479OsS0e+t3qXjDBa8OL41oQw+BfNi/nM6+4
         kDWTtHBPajr4SE7vq1cQucbSx5aic/OklSpM5FShvo7o+GYP5c2lpckVpmd3Q872VFmy
         ksHQ==
X-Gm-Message-State: ANoB5pmRqXrfo5ZuSo62kFlxwgDipb+fy2XfW+hFBm7HJBV0MCDVWzhl
        BoVLleX7lHZFBe0fFmPuv3LnxGZhWxKg
X-Google-Smtp-Source: AA0mqf4zeBtP2j6n46fS8oSE+AVmkT5P9/BZ/88BEzYVeXCdpKfNUqMwBjAxaBNNCFuuoxGRlsiKKQ==
X-Received: by 2002:a17:90a:bc48:b0:212:ed58:2825 with SMTP id t8-20020a17090abc4800b00212ed582825mr12638853pjv.199.1668406794387;
        Sun, 13 Nov 2022 22:19:54 -0800 (PST)
Received: from thinkpad ([117.248.0.54])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001783f964fe3sm4044075ple.113.2022.11.13.22.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 22:19:53 -0800 (PST)
Date:   Mon, 14 Nov 2022 11:49:47 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     lpieralisi@kernel.org, robh+dt@kernel.org, kw@linux.com,
        bhelgaas@google.com, krzk+dt@kernel.org,
        marek.vasut+renesas@gmail.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 05/10] PCI: designware-ep: Add ep_pre_init() callback
 to dw_pcie_ep_ops
Message-ID: <20221114061947.GA3869@thinkpad>
References: <20220922080647.3489791-1-yoshihiro.shimoda.uh@renesas.com>
 <20220922080647.3489791-6-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220922080647.3489791-6-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 22, 2022 at 05:06:42PM +0900, Yoshihiro Shimoda wrote:
> Some PCIe endpoint controllers need vendor-specific initialization
> before the common code initialization. Add a new callback function
> ep_pre_init() for it.
> 

Why can't you call the code associated with ep_pre_init() before calling
dw_pcie_ep_init() in probe?

Thanks,
Mani

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 3 +++
>  drivers/pci/controller/dwc/pcie-designware.h    | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index ca8f1804ee10..1b7e9e1b8d52 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -709,6 +709,9 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  
>  	dw_pcie_version_detect(pci);
>  
> +	if (ep->ops->ep_pre_init)
> +		ep->ops->ep_pre_init(ep);
> +
>  	dw_pcie_iatu_detect(pci);
>  
>  	ep->ib_window_map = devm_bitmap_zalloc(dev, pci->num_ib_windows,
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index b541f653c209..9ed9621a12e4 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -317,6 +317,7 @@ struct dw_pcie_rp {
>  };
>  
>  struct dw_pcie_ep_ops {
> +	void	(*ep_pre_init)(struct dw_pcie_ep *ep);
>  	void	(*ep_init)(struct dw_pcie_ep *ep);
>  	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
>  			     enum pci_epc_irq_type type, u16 interrupt_num);
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
