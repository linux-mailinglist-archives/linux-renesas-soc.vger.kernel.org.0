Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 248A07EAE34
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 11:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjKNKms (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 05:42:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjKNKmr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 05:42:47 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9C4D9;
        Tue, 14 Nov 2023 02:42:42 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-509c61e0cf4so6446322e87.2;
        Tue, 14 Nov 2023 02:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699958560; x=1700563360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eCTKEQT+hdaxsRjGuE89rsnSJKi9O0784g7pD+LZpD8=;
        b=mH5oNxMr8D5L9OPoY7iSWsILGDXI/wA4Qj6NEH9/SCD+9xY/YUfqrh5j1aCcWEq5UR
         42F2CRdynE7cWq2acNZBOCeYw/tS368+UPkhj68VfZcLp63+n3SJgMdf9nFcmFT4HK6d
         PBdgfJl6COi/GxAF4tyUpcxWTSkObIQ40mUaiWZSK4XlDf88Lh3D5N6vYX1pq2KyQWRw
         J7GqcrOwzpC3uqi+cOJBjG1Vn6caSWXB2Q44IhBaNe/+A3Is7HACnZrb7n/vnYEJjYlj
         mHTpS90xT6qCTcHCFT5jDhd0f1Mh7Vul3JmZv/Dw8kGhVAQ2RnyTtCh9BFKak8szhkuy
         bjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699958560; x=1700563360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCTKEQT+hdaxsRjGuE89rsnSJKi9O0784g7pD+LZpD8=;
        b=EREWTePetrOGUBvVSfzZ28HbeMACB/zfYLdKuHYR4RHGPZhVHmf8FK7b4/MUdrFn+H
         qS99yQPHQ5LF607FDT2hLZNfa6aNzXaFdPOPDNGoQaeUv4vh/zQUhmKiUUgft5yb6XZg
         d8iNilv/dTx7v9IAiKPyOeNIiSGOu4FlbVaD1KqZnzXOWuswQ+NJy3xSdIkJPoZWWuwT
         6kIsvZZEdidZGdkxgsRU34xJQN04piASTjEmfGgmT/B78EqUlkItuSOxAt22NtRU4zDc
         SDKc9kKAHTW+E4/wbj0PpezR1H98JKHzXPzWvtcKouzr3jjpVqUkkDtXEn+y09Zh6Zw+
         d76w==
X-Gm-Message-State: AOJu0YzyGvxnc4JIlQsY4GVXqEWjSoY1octC97d67iQ5QdEucEoU6Wc+
        tsa3r+QQqgEVYGgvQR/G9X0=
X-Google-Smtp-Source: AGHT+IH05uNrjV63ztLvrf0P0aIMXbI22ztjxVSYR01hZs6OZ+pZLV9ROMaSmHkC2tZGv8yp9ipvrA==
X-Received: by 2002:a05:6512:445:b0:507:a8d1:6e56 with SMTP id y5-20020a056512044500b00507a8d16e56mr5673575lfk.35.1699958560048;
        Tue, 14 Nov 2023 02:42:40 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id y19-20020ac24473000000b005094bb01fc9sm1286935lfl.214.2023.11.14.02.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:42:39 -0800 (PST)
Date:   Tue, 14 Nov 2023 13:42:36 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
        bhelgaas@google.com, jingoohan1@gmail.com,
        gustavo.pimentel@synopsys.com, mani@kernel.org,
        linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Minghuan Lian <minghuan.Lian@nxp.com>,
        Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
        Yue Wang <yue.wang@amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jonathan Chocron <jonnyc@amazon.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Chuanhua Lei <lchuanhua@maxlinear.com>,
        Xiaowei Song <songxiaowei@hisilicon.com>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Pratyush Anand <pratyush.anand@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: Re: [PATCH v2 1/6] PCI: dwc: Drop host prefix from struct
 dw_pcie_host_ops
Message-ID: <7opp7cvz3gojhmmcg4zmsnkd26rb2wkrtnx3546undm56g5vgi@ceak7mdzcm52>
References: <20231114055456.2231990-1-yoshihiro.shimoda.uh@renesas.com>
 <20231114055456.2231990-2-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114055456.2231990-2-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 14, 2023 at 02:54:51PM +0900, Yoshihiro Shimoda wrote:
> Since the name of dw_pcie_host_ops indicates that it's for host
> obviously, drop host prefix from the struct.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Awesome. Thanks!
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Minghuan Lian <minghuan.Lian@nxp.com>
> Cc: Mingkai Hu <mingkai.hu@nxp.com>
> Cc: Roy Zang <roy.zang@nxp.com>
> Cc: Yue Wang <yue.wang@Amlogic.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jonathan Chocron <jonnyc@amazon.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Jesper Nilsson <jesper.nilsson@axis.com>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Greentime Hu <greentime.hu@sifive.com>
> Cc: Chuanhua Lei <lchuanhua@maxlinear.com>
> Cc: Xiaowei Song <songxiaowei@hisilicon.com>
> Cc: Binghui Wang <wangbinghui@hisilicon.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Pratyush Anand <pratyush.anand@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c       |  2 +-
>  drivers/pci/controller/dwc/pci-exynos.c       |  2 +-
>  drivers/pci/controller/dwc/pci-imx6.c         |  4 +--
>  drivers/pci/controller/dwc/pci-keystone.c     |  6 ++--
>  drivers/pci/controller/dwc/pci-layerscape.c   |  2 +-
>  drivers/pci/controller/dwc/pci-meson.c        |  2 +-
>  drivers/pci/controller/dwc/pcie-al.c          |  2 +-
>  drivers/pci/controller/dwc/pcie-armada8k.c    |  2 +-
>  drivers/pci/controller/dwc/pcie-artpec6.c     |  2 +-
>  drivers/pci/controller/dwc/pcie-bt1.c         |  4 +--
>  .../pci/controller/dwc/pcie-designware-host.c | 30 +++++++++----------
>  drivers/pci/controller/dwc/pcie-designware.h  |  8 ++---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  2 +-
>  drivers/pci/controller/dwc/pcie-fu740.c       |  2 +-
>  drivers/pci/controller/dwc/pcie-histb.c       |  2 +-
>  drivers/pci/controller/dwc/pcie-intel-gw.c    |  2 +-
>  drivers/pci/controller/dwc/pcie-kirin.c       |  2 +-
>  drivers/pci/controller/dwc/pcie-qcom.c        |  6 ++--
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 +--
>  drivers/pci/controller/dwc/pcie-spear13xx.c   |  2 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c    |  2 +-
>  drivers/pci/controller/dwc/pcie-uniphier.c    |  2 +-
>  drivers/pci/controller/dwc/pcie-visconti.c    |  2 +-
>  23 files changed, 47 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index b445ffe95e3f..6125a838f4b1 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -371,7 +371,7 @@ static int dra7xx_pcie_init_irq_domain(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops dra7xx_pcie_host_ops = {
> -	.host_init = dra7xx_pcie_host_init,
> +	.init = dra7xx_pcie_host_init,
>  };
>  
>  static void dra7xx_pcie_ep_init(struct dw_pcie_ep *ep)
> diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
> index c6bede346932..673ae213203f 100644
> --- a/drivers/pci/controller/dwc/pci-exynos.c
> +++ b/drivers/pci/controller/dwc/pci-exynos.c
> @@ -268,7 +268,7 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops exynos_pcie_host_ops = {
> -	.host_init = exynos_pcie_host_init,
> +	.init = exynos_pcie_host_init,
>  };
>  
>  static int exynos_add_pcie_port(struct exynos_pcie *ep,
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 74703362aeec..b02f6f14a411 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1039,8 +1039,8 @@ static void imx6_pcie_host_exit(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops imx6_pcie_host_ops = {
> -	.host_init = imx6_pcie_host_init,
> -	.host_deinit = imx6_pcie_host_exit,
> +	.init = imx6_pcie_host_init,
> +	.deinit = imx6_pcie_host_exit,
>  };
>  
>  static const struct dw_pcie_ops dw_pcie_ops = {
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 0def919f89fa..3711347ddc87 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -838,12 +838,12 @@ static int __init ks_pcie_host_init(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops ks_pcie_host_ops = {
> -	.host_init = ks_pcie_host_init,
> -	.msi_host_init = ks_pcie_msi_host_init,
> +	.init = ks_pcie_host_init,
> +	.msi_init = ks_pcie_msi_host_init,
>  };
>  
>  static const struct dw_pcie_host_ops ks_pcie_am654_host_ops = {
> -	.host_init = ks_pcie_host_init,
> +	.init = ks_pcie_host_init,
>  };
>  
>  static irqreturn_t ks_pcie_err_irq_handler(int irq, void *priv)
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 37956e09c65b..0c3d7ef729cb 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -169,7 +169,7 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
> -	.host_init = ls_pcie_host_init,
> +	.init = ls_pcie_host_init,
>  	.pme_turn_off = ls_pcie_send_turnoff_msg,
>  };
>  
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 407558f5d74a..6477c83262c2 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -389,7 +389,7 @@ static int meson_pcie_host_init(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops meson_pcie_host_ops = {
> -	.host_init = meson_pcie_host_init,
> +	.init = meson_pcie_host_init,
>  };
>  
>  static const struct dw_pcie_ops dw_pcie_ops = {
> diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controller/dwc/pcie-al.c
> index b8cb77c9c4bd..6dfdda59f328 100644
> --- a/drivers/pci/controller/dwc/pcie-al.c
> +++ b/drivers/pci/controller/dwc/pcie-al.c
> @@ -311,7 +311,7 @@ static int al_pcie_host_init(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops al_pcie_host_ops = {
> -	.host_init = al_pcie_host_init,
> +	.init = al_pcie_host_init,
>  };
>  
>  static int al_pcie_probe(struct platform_device *pdev)
> diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
> index 5c999e15c357..b5c599ccaacf 100644
> --- a/drivers/pci/controller/dwc/pcie-armada8k.c
> +++ b/drivers/pci/controller/dwc/pcie-armada8k.c
> @@ -225,7 +225,7 @@ static irqreturn_t armada8k_pcie_irq_handler(int irq, void *arg)
>  }
>  
>  static const struct dw_pcie_host_ops armada8k_pcie_host_ops = {
> -	.host_init = armada8k_pcie_host_init,
> +	.init = armada8k_pcie_host_init,
>  };
>  
>  static int armada8k_add_pcie_port(struct armada8k_pcie *pcie,
> diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> index 9b572a2b2c9a..2f32fcd8933c 100644
> --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> @@ -333,7 +333,7 @@ static int artpec6_pcie_host_init(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops artpec6_pcie_host_ops = {
> -	.host_init = artpec6_pcie_host_init,
> +	.init = artpec6_pcie_host_init,
>  };
>  
>  static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
> diff --git a/drivers/pci/controller/dwc/pcie-bt1.c b/drivers/pci/controller/dwc/pcie-bt1.c
> index 17e696797ff5..76d0ddea8007 100644
> --- a/drivers/pci/controller/dwc/pcie-bt1.c
> +++ b/drivers/pci/controller/dwc/pcie-bt1.c
> @@ -559,8 +559,8 @@ static void bt1_pcie_host_deinit(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops bt1_pcie_host_ops = {
> -	.host_init = bt1_pcie_host_init,
> -	.host_deinit = bt1_pcie_host_deinit,
> +	.init = bt1_pcie_host_init,
> +	.deinit = bt1_pcie_host_deinit,
>  };
>  
>  static struct bt1_pcie *bt1_pcie_create_data(struct platform_device *pdev)
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 7991f0e179b2..d5fc31f8345f 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -441,14 +441,14 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	bridge->ops = &dw_pcie_ops;
>  	bridge->child_ops = &dw_child_pcie_ops;
>  
> -	if (pp->ops->host_init) {
> -		ret = pp->ops->host_init(pp);
> +	if (pp->ops->init) {
> +		ret = pp->ops->init(pp);
>  		if (ret)
>  			return ret;
>  	}
>  
>  	if (pci_msi_enabled()) {
> -		pp->has_msi_ctrl = !(pp->ops->msi_host_init ||
> +		pp->has_msi_ctrl = !(pp->ops->msi_init ||
>  				     of_property_read_bool(np, "msi-parent") ||
>  				     of_property_read_bool(np, "msi-map"));
>  
> @@ -464,8 +464,8 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  			goto err_deinit_host;
>  		}
>  
> -		if (pp->ops->msi_host_init) {
> -			ret = pp->ops->msi_host_init(pp);
> +		if (pp->ops->msi_init) {
> +			ret = pp->ops->msi_init(pp);
>  			if (ret < 0)
>  				goto err_deinit_host;
>  		} else if (pp->has_msi_ctrl) {
> @@ -502,8 +502,8 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	if (ret)
>  		goto err_stop_link;
>  
> -	if (pp->ops->host_post_init)
> -		pp->ops->host_post_init(pp);
> +	if (pp->ops->post_init)
> +		pp->ops->post_init(pp);
>  
>  	return 0;
>  
> @@ -518,8 +518,8 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  		dw_pcie_free_msi(pp);
>  
>  err_deinit_host:
> -	if (pp->ops->host_deinit)
> -		pp->ops->host_deinit(pp);
> +	if (pp->ops->deinit)
> +		pp->ops->deinit(pp);
>  
>  	return ret;
>  }
> @@ -539,8 +539,8 @@ void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
>  	if (pp->has_msi_ctrl)
>  		dw_pcie_free_msi(pp);
>  
> -	if (pp->ops->host_deinit)
> -		pp->ops->host_deinit(pp);
> +	if (pp->ops->deinit)
> +		pp->ops->deinit(pp);
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_host_deinit);
>  
> @@ -842,8 +842,8 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  		return ret;
>  	}
>  
> -	if (pci->pp.ops->host_deinit)
> -		pci->pp.ops->host_deinit(&pci->pp);
> +	if (pci->pp.ops->deinit)
> +		pci->pp.ops->deinit(&pci->pp);
>  
>  	pci->suspended = true;
>  
> @@ -860,8 +860,8 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
>  
>  	pci->suspended = false;
>  
> -	if (pci->pp.ops->host_init) {
> -		ret = pci->pp.ops->host_init(&pci->pp);
> +	if (pci->pp.ops->init) {
> +		ret = pci->pp.ops->init(&pci->pp);
>  		if (ret) {
>  			dev_err(pci->dev, "Host init failed: %d\n", ret);
>  			return ret;
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 55ff76e3d384..5c4518ad1bec 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -300,10 +300,10 @@ enum dw_pcie_ltssm {
>  };
>  
>  struct dw_pcie_host_ops {
> -	int (*host_init)(struct dw_pcie_rp *pp);
> -	void (*host_deinit)(struct dw_pcie_rp *pp);
> -	void (*host_post_init)(struct dw_pcie_rp *pp);
> -	int (*msi_host_init)(struct dw_pcie_rp *pp);
> +	int (*init)(struct dw_pcie_rp *pp);
> +	void (*deinit)(struct dw_pcie_rp *pp);
> +	void (*post_init)(struct dw_pcie_rp *pp);
> +	int (*msi_init)(struct dw_pcie_rp *pp);
>  	void (*pme_turn_off)(struct dw_pcie_rp *pp);
>  };
>  
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 2fe42c70097f..961dabcb1ec8 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -215,7 +215,7 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
> -	.host_init = rockchip_pcie_host_init,
> +	.init = rockchip_pcie_host_init,
>  };
>  
>  static int rockchip_pcie_clk_init(struct rockchip_pcie *rockchip)
> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
> index 1e9b44b8bba4..66367252032b 100644
> --- a/drivers/pci/controller/dwc/pcie-fu740.c
> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
> @@ -279,7 +279,7 @@ static int fu740_pcie_host_init(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops fu740_pcie_host_ops = {
> -	.host_init = fu740_pcie_host_init,
> +	.init = fu740_pcie_host_init,
>  };
>  
>  static const struct dw_pcie_ops dw_pcie_ops = {
> diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
> index fd484cc7c481..7a11c618b9d9 100644
> --- a/drivers/pci/controller/dwc/pcie-histb.c
> +++ b/drivers/pci/controller/dwc/pcie-histb.c
> @@ -198,7 +198,7 @@ static int histb_pcie_host_init(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops histb_pcie_host_ops = {
> -	.host_init = histb_pcie_host_init,
> +	.init = histb_pcie_host_init,
>  };
>  
>  static void histb_pcie_host_disable(struct histb_pcie *hipcie)
> diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
> index c9c93524e01d..be52e9db44af 100644
> --- a/drivers/pci/controller/dwc/pcie-intel-gw.c
> +++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
> @@ -391,7 +391,7 @@ static const struct dw_pcie_ops intel_pcie_ops = {
>  };
>  
>  static const struct dw_pcie_host_ops intel_pcie_dw_ops = {
> -	.host_init =		intel_pcie_rc_init,
> +	.init =		intel_pcie_rc_init,
>  };
>  
>  static int intel_pcie_probe(struct platform_device *pdev)
> diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
> index 2ee146767971..c50e183f88d6 100644
> --- a/drivers/pci/controller/dwc/pcie-kirin.c
> +++ b/drivers/pci/controller/dwc/pcie-kirin.c
> @@ -672,7 +672,7 @@ static const struct dw_pcie_ops kirin_dw_pcie_ops = {
>  };
>  
>  static const struct dw_pcie_host_ops kirin_pcie_host_ops = {
> -	.host_init = kirin_pcie_host_init,
> +	.init = kirin_pcie_host_init,
>  };
>  
>  static int kirin_pcie_power_off(struct kirin_pcie *kirin_pcie)
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 6902e97719d1..cd986f50ec4a 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1244,9 +1244,9 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
> -	.host_init	= qcom_pcie_host_init,
> -	.host_deinit	= qcom_pcie_host_deinit,
> -	.host_post_init	= qcom_pcie_host_post_init,
> +	.init		= qcom_pcie_host_init,
> +	.deinit		= qcom_pcie_host_deinit,
> +	.post_init	= qcom_pcie_host_post_init,
>  };
>  
>  /* Qcom IP rev.: 2.1.0	Synopsys IP rev.: 4.01a */
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 3bc45e513b3d..193ed88d3c2f 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -307,8 +307,8 @@ static void rcar_gen4_pcie_host_deinit(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops rcar_gen4_pcie_host_ops = {
> -	.host_init = rcar_gen4_pcie_host_init,
> -	.host_deinit = rcar_gen4_pcie_host_deinit,
> +	.init = rcar_gen4_pcie_host_init,
> +	.deinit = rcar_gen4_pcie_host_deinit,
>  };
>  
>  static int rcar_gen4_add_dw_pcie_rp(struct rcar_gen4_pcie *rcar)
> diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
> index 99d47ae80331..201dced209f0 100644
> --- a/drivers/pci/controller/dwc/pcie-spear13xx.c
> +++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
> @@ -148,7 +148,7 @@ static int spear13xx_pcie_host_init(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops spear13xx_pcie_host_ops = {
> -	.host_init = spear13xx_pcie_host_init,
> +	.init = spear13xx_pcie_host_init,
>  };
>  
>  static int spear13xx_add_pcie_port(struct spear13xx_pcie *spear13xx_pcie,
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 0fe113598ebb..52e26ed61380 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1060,7 +1060,7 @@ static const struct dw_pcie_ops tegra_dw_pcie_ops = {
>  };
>  
>  static const struct dw_pcie_host_ops tegra_pcie_dw_host_ops = {
> -	.host_init = tegra_pcie_dw_host_init,
> +	.init = tegra_pcie_dw_host_init,
>  };
>  
>  static void tegra_pcie_disable_phy(struct tegra_pcie_dw *pcie)
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
> index 48c3eba817b4..354fb3bd0a19 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier.c
> @@ -311,7 +311,7 @@ static int uniphier_pcie_host_init(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops uniphier_pcie_host_ops = {
> -	.host_init = uniphier_pcie_host_init,
> +	.init = uniphier_pcie_host_init,
>  };
>  
>  static int uniphier_pcie_host_enable(struct uniphier_pcie *pcie)
> diff --git a/drivers/pci/controller/dwc/pcie-visconti.c b/drivers/pci/controller/dwc/pcie-visconti.c
> index 71026fefa366..318c278e65c8 100644
> --- a/drivers/pci/controller/dwc/pcie-visconti.c
> +++ b/drivers/pci/controller/dwc/pcie-visconti.c
> @@ -236,7 +236,7 @@ static int visconti_pcie_host_init(struct dw_pcie_rp *pp)
>  }
>  
>  static const struct dw_pcie_host_ops visconti_pcie_host_ops = {
> -	.host_init = visconti_pcie_host_init,
> +	.init = visconti_pcie_host_init,
>  };
>  
>  static int visconti_get_resources(struct platform_device *pdev,
> -- 
> 2.34.1
> 
