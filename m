Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62D2319A70
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Feb 2021 08:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbhBLHcf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Feb 2021 02:32:35 -0500
Received: from mail-lf1-f43.google.com ([209.85.167.43]:40270 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbhBLHa3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Feb 2021 02:30:29 -0500
Received: by mail-lf1-f43.google.com with SMTP id v24so11767969lfr.7;
        Thu, 11 Feb 2021 23:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=oHM+FbSwfw+bAEOtvRPNgvbEO07PEfYAR+cRoJRtIhE=;
        b=IBCWWsslmaeYWDjFjxskJd3VDUxunkKuHAa7xftANS2opSO46uaPvDBoFhnH7QEBz5
         lcG8D8KYdjMc40cN+Le907oJnxH0RL9V/O0bviSRgMSvSqMbIpcKcwzdtzCsFJkXSV2M
         9a8tzjclRiVJnMqOUvjuQqttYQx3wu9vhxRnmOSkMGJ0oC+CXZQ5pU0CW8LbdWokBl0F
         sYbNumBNzXpdM6qSBXPuwM6iNI0j9Hfwqw235U8tS6cR9nrtnxlOMgrK9mZUs7JhXDJS
         INOW+yBsvY98iDisuVtvnNyUQNik2tll5iztic6/eJt1FsiSFQkapSUnfBkgNbB8tNFL
         CD4w==
X-Gm-Message-State: AOAM53144Jt8pGvUEtxq6PTSExCifDevlrwdaLcOS/UrR5UTxKhzElxM
        rqM4KG5BpUh7DiMQoxduQVM=
X-Google-Smtp-Source: ABdhPJxsTpcP9GhEE4ZXq/AR57UPCrjzy+mLS/MTfYx4ynoRV0m9jMpm49v8AXzQrU+hc8gewveWbQ==
X-Received: by 2002:a05:6512:3743:: with SMTP id a3mr936281lfs.8.1613114985467;
        Thu, 11 Feb 2021 23:29:45 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id w3sm883599lft.35.2021.02.11.23.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 23:29:44 -0800 (PST)
Message-ID: <b7019810a6450f43714573f227b0082f8e029634.camel@fi.rohmeurope.com>
Subject: Re: [RFC PATCH 4/7] regulator: add property parsing and callbacks
 to set protection limits
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <19d533dbc99d610c40b9023dba7da7a9eaadbe3d.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
         <19d533dbc99d610c40b9023dba7da7a9eaadbe3d.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Fri, 12 Feb 2021 09:29:39 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On Thu, 2021-02-11 at 14:35 +0200, Matti Vaittinen wrote:
> Add DT property parsing code and setting callback for regulator
> over/under
> voltage, over-current and temperature error limits.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/regulator/core.c                  | 122
> +++++++++++++++++++++-
>  drivers/regulator/of_regulator.c          |  58 ++++++++++
>  drivers/regulator/qcom-labibb-regulator.c |  10 +-
>  drivers/regulator/stpmic1_regulator.c     |  17 ++-
>  include/linux/regulator/driver.h          |  41 +++++++-
>  include/linux/regulator/machine.h         |  26 +++++
>  6 files changed, 267 insertions(+), 7 deletions(-)

Just a note. I did somehow miss the qcom_spmi-regulator.c which also
uses the .set_over_current_protection. I will include that file in next
version if the idea is still seen worthy. Sorry for the incompleteness.

Best Regards
	Matti Vaittinen


