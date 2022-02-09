Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156014AFCC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Feb 2022 20:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241750AbiBITCD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Feb 2022 14:02:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241654AbiBITAV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Feb 2022 14:00:21 -0500
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BE1C02B5E6;
        Wed,  9 Feb 2022 10:58:29 -0800 (PST)
Received: by mail-ot1-f50.google.com with SMTP id o9-20020a9d7189000000b0059ee49b4f0fso2195905otj.2;
        Wed, 09 Feb 2022 10:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kfS2tc0AzsIzDQltvbOtE1I0l9vkTyfE/J6yUpGln0c=;
        b=xXgFLm5sORW+pqsWc7bkp2Cnb+RwcdZ5n9obs1TN4PBDKjtUhEv45Bj2MpshXq2Gth
         SmRC/Z+B6/QgceRbghIrb6U42WmmpfWsoZGrqOw07oa6/JG1d2oYb2TW1d25hkFxRRH5
         breVr2NEIR5MCh4UAQwj6WGeoUC8OodAQ4oJ7lUBsLMdTtw+wMIytcoe3jO7aeBdLk8Y
         hlUkdjgEwFHXuViZdSn1RZ+YsT/vAvZaBZeMeVTefzNLESW+CzhOd06wHwHmT7XwjJpO
         xy3HhTU75rk/sMhW+ncqG29e0K1We53+71+zur69f4IikYhSOUn0aGqUt7und8w4MEVB
         ROhw==
X-Gm-Message-State: AOAM532PvBt5FL0CraOBxrFG0T5WBGYeCIWkgoFr+yXTFNm7OJps9lvW
        X29Haot/AWKQX2pSLONMLg==
X-Google-Smtp-Source: ABdhPJy1QLereUHPHn+KQEWWdGdMvIbLw4PjCtA2U9SLf9F3FBDMGU46oKwFhWmbysAO9gyuABLqbA==
X-Received: by 2002:a05:6830:1019:: with SMTP id a25mr1520526otp.28.1644433105193;
        Wed, 09 Feb 2022 10:58:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n24sm7838348oao.40.2022.02.09.10.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 10:58:24 -0800 (PST)
Received: (nullmailer pid 692950 invoked by uid 1000);
        Wed, 09 Feb 2022 18:58:23 -0000
Date:   Wed, 9 Feb 2022 12:58:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        will@kernel.org, robh+dt@kernel.org,
        linux-renesas-soc@vger.kernel.org, joro@8bytes.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: add
 r8a779f0 support
Message-ID: <YgQOz+YIkWJJFp/M@robh.at.kernel.org>
References: <20220208002030.1319984-1-yoshihiro.shimoda.uh@renesas.com>
 <20220208002030.1319984-2-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208002030.1319984-2-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 08 Feb 2022 09:20:29 +0900, Yoshihiro Shimoda wrote:
> Document the compatible values for the IPMMU-VMSA blocks in
> the Renesas R-Car S4-8 (R8A779F0) SoC and R-Car Gen4.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
