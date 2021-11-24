Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5548045C8BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 16:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240986AbhKXPgM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 10:36:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232312AbhKXPgM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 10:36:12 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D530C06173E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Nov 2021 07:33:02 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id p18so2764163wmq.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Nov 2021 07:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=js+dElCSMTX7Q9ab9rdTN6VQUCoOGsYNSHNvRUS+woE=;
        b=IeDlxxwdVD2nn9LdcWrTH1KckkvgymSSUD0HgXJzeuI3Ta8JBrHIXX3NwN1h92qcRI
         +GvB2u+N1u0E/ZMYwSXV8+T5XWbuorwN4Wfdjdh29aZdP+Ry30j7VLkZBOVpbxNdOfY0
         koB6lIlz8Grsrkj5ZgQ++hRQfb2j395Dv2a1o0VJaVA9Qdu2sPDWNzo7UuofYLtlPnmI
         AFkXGs6bAATZphx0678pJNf4jvFMRkKfq5LQEwaSgZkuxRBFH0sW8gdSJNjYcReE4Dow
         AyiANDAcNcsP+XMiKlyXIpcRxHN7bl1ky2F8MyGIVyYDsRNyMFB6fujqSNW5+W1H7Bcr
         PgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=js+dElCSMTX7Q9ab9rdTN6VQUCoOGsYNSHNvRUS+woE=;
        b=BTEVicvAZ+3R7IZ1VRKwbwVMdlpG+Xwe9P6QaJs1o+WUEW4Cz//J/TTzexae5MjzSM
         zf16foEcWsYEMzsrNqf13pU8a/2+kdVtn7thCzzSDPmcB6d0tQA9oliWsfp0O093oajE
         9kiHIbHHPk6yiu0C+HTMptANymPZ0Oz0dqFL/pDhcAUTGyNyOr9ICpi6ZNSnUg/hjHfb
         kliTdyIcMbzBJjelr8Dn7FwDDQg8WsGvZXYFzqCJx752ILnPKLaLWK9OKQHQo42R8+0W
         MlRh9IJV2uwsZea13ivuGjQXt2cSzXm8xwT+As8drf5/IPS/rwHQyB1btl+swkgcfx/y
         YcFA==
X-Gm-Message-State: AOAM530+JG2XLn2mPh+2ZB7ShJCUCYgDEyxv+hnKuBmeyQFCgsYt7rio
        Hr40NJ09i7o+HByTkUTJuSvhFA==
X-Google-Smtp-Source: ABdhPJxCSL294XX2VDzJ7+/6CRPgIiCEJuop+WAiccCtSi+uidF7m5EQdsY9lZCfcw7yL1rhG39D3A==
X-Received: by 2002:a1c:1f94:: with SMTP id f142mr16695124wmf.192.1637767979747;
        Wed, 24 Nov 2021 07:32:59 -0800 (PST)
Received: from google.com ([2.31.167.61])
        by smtp.gmail.com with ESMTPSA id m9sm75155wmq.1.2021.11.24.07.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 07:32:59 -0800 (PST)
Date:   Wed, 24 Nov 2021 15:32:57 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v3] dt-bindings: mfd: bd9571mwv: Convert to json-schema
Message-ID: <YZ5bKYZ0SF9xZU9F@google.com>
References: <76fdd209e6a2dada7ff50b8ad03eb14e7f3547a6.1635338031.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76fdd209e6a2dada7ff50b8ad03eb14e7f3547a6.1635338031.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 27 Oct 2021, Geert Uytterhoeven wrote:

> Convert the ROHM BD9571MWV/BD9574MWF Power Management Integrated Circuit
> (PMIC) Device Tree binding documentation to json-schema.
> 
> Make the "regulators" subnode optional, as not all users describe the
> regulators.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> I have listed Marek as the maintainer, as he wrote the original
> bindings.  Marek: Please scream if this is inappropriate ;-)
> 
> v3:
>   - Add Acked-by,
> 
> v2:
>   - Add Reviewed-by.
> ---
>  .../devicetree/bindings/mfd/bd9571mwv.txt     |  69 ----------
>  .../bindings/mfd/rohm,bd9571mwv.yaml          | 127 ++++++++++++++++++
>  2 files changed, 127 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/bd9571mwv.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9571mwv.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
