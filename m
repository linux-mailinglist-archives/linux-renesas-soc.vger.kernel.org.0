Return-Path: <linux-renesas-soc+bounces-3585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0B0875DCC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 06:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32769282523
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 05:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E750C339A1;
	Fri,  8 Mar 2024 05:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zd+u7b/x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB652E65B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Mar 2024 05:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709876643; cv=none; b=KyaYoXFn6ih5T7Xn0AtxbqI0R0UejW4OEIBkl1PRENi+vDbdx6FTFlhQx+va6aZBbgXUjaay7WLMTLmwX6s4vWBSQExuyBg4t9H3x9zUg66A9RPU14kpOaAiqdBwTBQZrawKYbeOqUvZvw4+RfOhun0CzpNTX3C6xkMVRJtHEWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709876643; c=relaxed/simple;
	bh=l8mRvqhe3rCJcL5EfXN0mb564Hh0Pb6/VhQn5bYxOzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVHa5oYMwV+PFfRuqmCcVzUir8RnabP5Lj+T1pl11HEwRfDMkjgVTXYDasJiY9qxbFYjogM6CziEhJjJkLn41lsPRSRUl3Fe0jpT2Uyar2s1HjZgrMFogs3gmVVHem9S7lp7eXHpsFxnaF3pRRVSBo/Ywkdc+cvye2O/fRMhE8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zd+u7b/x; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e622b46f45so419752b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Mar 2024 21:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709876642; x=1710481442; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pP3WC4SyW/Vzti9hv7dYhKLJSQ5hGnrzQR/QY37QH6U=;
        b=zd+u7b/xgUU80tS+jXojilCTJsZNAWM0d/l1V2BF7G3oMIX/oHjrnKgWd2Y5dPETnX
         CmipROa7r+nU+Fdg1Uap2Jk6f44e/qPEA0R63CrgAKhltZMrOk0TR+adtl/8hl9t98K5
         35BOmSiUcEN61VdQAxeczgEZjLHCOhxH6Ccu6EPqDfm3VGfhnFetaA3kZxaquwgh3RG5
         oRVJLoynmllmSaMbUmqjusGc2fsoja+oa4/hwz7soyBV61zju8MaIGwePXOnI2G3AS/W
         G2qF3pYugdabM8Os35OITh5uSuGb9mC5zvO4BqdxiVUbi4VWE3RdA4hbQV1wa/yr6sHW
         Yicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709876642; x=1710481442;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pP3WC4SyW/Vzti9hv7dYhKLJSQ5hGnrzQR/QY37QH6U=;
        b=uqW52kPDNcyLJVbI/NL0fzZMYJp9YZ3TMsil+m4m1WFgIKHSAvN2bAW9XY242iXb4B
         KnrgNfD2f3aQIBlZT4qVoN73hI1z9A2otW0JGlywKuA0c7j4zC1o4VhwDkW3083AjBqk
         000jigkKt65UH/dcKuiQPJ/s1Nn6JWfQaseVRE07dJL4MSzI0TYBuGxzyWFA2sM2ckmn
         Pq4X7UN2rP/oOLq9sFO/O20wVHPzaB13MF9jBzbJICqc5s9kNDjGvCD7lNF5tH3eFnjB
         esBzAY7LOkxjhmdhwMNY31f1P/71B44x5bzZZ5lNwwvbC209gUqwuPu3qgCV//UjMXDb
         4n4w==
X-Forwarded-Encrypted: i=1; AJvYcCXjZAHvpXgoAVbw0rkGHSQcIqivEUI2so1gZY+YJKLTcV7EhaCW+Vg8obtUqHgAPdqzqcgrQLauUHHzyfIhm9I17Fj3JWVGkPTpZ81++1PVm/Y=
X-Gm-Message-State: AOJu0Yye6mZZTiMIW3lkduqEaEK1h6Z5MwW8/Wkds+WAEq1zD7kZC/Y/
	nN3T7NOSozfH35SBmfTmF/XAGvKSv3wD5MjXGNyUT3V7ulEECM5vi4we/5Tpqw==
X-Google-Smtp-Source: AGHT+IF4OBcYmj84dqXR/j7tUWistQOyDNgAnoteok0JgpLNMa/4XKXGz0eVlhJR+Ieyw9pe6cuoUw==
X-Received: by 2002:a05:6a00:815:b0:6e5:9a92:f99b with SMTP id m21-20020a056a00081500b006e59a92f99bmr19446806pfk.16.1709876641435;
        Thu, 07 Mar 2024 21:44:01 -0800 (PST)
Received: from thinkpad ([117.217.178.39])
        by smtp.gmail.com with ESMTPSA id e3-20020aa79803000000b006e5667793d4sm13354830pfl.66.2024.03.07.21.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 21:44:01 -0800 (PST)
Date: Fri, 8 Mar 2024 11:13:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v9 10/10] PCI: dwc: ep: Add Kernel-doc comments for APIs
Message-ID: <20240308054347.GE3789@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-10-29d433d99cda@linaro.org>
 <Zeo4dJGZYLnLfzjm@ryzen>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zeo4dJGZYLnLfzjm@ryzen>

On Thu, Mar 07, 2024 at 10:58:12PM +0100, Niklas Cassel wrote:
> On Mon, Mar 04, 2024 at 02:52:22PM +0530, Manivannan Sadhasivam wrote:
> > All of the APIs are missing the Kernel-doc comments. Hence, add them.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> For the functions that you added in this series, e.g.
> dw_pcie_ep_cleanup(), dw_pcie_ep_init_non_sticky_registers(),
> and dw_pcie_ep_linkdown(), I think that it would have been
> better if you actually added the kdoc in the same commit that
> added the respective function.
> 
> 
> For the existing functions that did not have a kdoc, I think
> it would have been better if you fixed this as patch 1/10 in
> this series. (Or 2/10, in case you keep the Fixes tag for the
> "PCI: dwc: ep: Fix DBI access failure for drivers requiring
> refclk from host" patch.)
> 
> Yes, I know that you rename some of these functions that
> lacked kdoc later in the series, but the whole kdoc description
> would be the same, the kdoc parameters would be the same, and the
> kdoc return value would be the same.
> 
> If you later rename a function, you would only need to change
> the kdoc function name (in addition to the function declaration
> itself).
> 

Makes sense! Will change it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

