Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D57715F4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 14:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbjE3M2v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 08:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbjE3M2o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 08:28:44 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D968B0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 05:28:15 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5148f299105so6529065a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 05:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685449693; x=1688041693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DgW0b21c5MMnUODN29h76/cz88VjrUmb7STioFdZp4U=;
        b=YnfI/vFbdJphzRlbmJvEZKq/zoeu8NORH/Zo7cZPbZZPatQHdyLI3924dzOEH1kcu9
         PSDCfIPjYs9kIebVi89c+Gei7gWq6YfuYbgUCZJmO8OFuP3HhkAbSdWJ01CedPYLoQbn
         lI5wXyp+BYIlv/uzfN2Cmej0fYnSQDw+pePq6C8Y5FytkUhcrdRfulxdJ8PzE0XJCU2A
         nf8Yu9bfCx2ebVnEbrGZPM1jqItIxSRB2EbnSoWjA7+O6RqBCs9zxQ4MlIePF5NyvoO2
         kQfXrHcgCfDtFNmTIMWWHOV09OgfDUHytSWli6N43KQAOmgcZItfc1lkHl/Nk8hvSZIu
         EV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449694; x=1688041694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgW0b21c5MMnUODN29h76/cz88VjrUmb7STioFdZp4U=;
        b=lyT0e+L8fQmGRDcF5hcKsQdSbsg4dIclJBJtcCbra8SCmzx5LJHVOAJVH78/8NPaTC
         DSv0RTeMk0U0GID9k3cMkKMay/1BA098OhGICmVFTcjnAln7RsOAoiDpL+RkKWtb5jxs
         4dVuNrjiAamI86VsWL160IMd42YIfZaajuhHoFWLljbWIzl2o6ZQTVetpM5wn1ZZwxPk
         /UwofdlQrbItGvtIN+vEdFX225m+aEl0j3pp4LOp4KPzllMxK05QUlnQhqyxkDP9OR0d
         wIREaLkcfkM/vtBXnfUZ4x69MY/hq0LGRMqm4goGElWAshIS/qfufCzHfE6V44DyzPJ7
         G24A==
X-Gm-Message-State: AC+VfDz9VvA0t6RTToGu8G/u0enAlT88sdtHsKoETq5hTO/qyOQjObAi
        R7KnYSrbGpTph6o/9WhHP8clpg==
X-Google-Smtp-Source: ACHHUZ4hR9hcIAXw4L5o2HGVRGn0EpHKF6Gh3qDgF8K4m45x0Sa7f++M71nH65Ud6nT3agRhePn28A==
X-Received: by 2002:a05:6402:2038:b0:514:9e47:4319 with SMTP id ay24-20020a056402203800b005149e474319mr2254551edb.5.1685449693759;
        Tue, 30 May 2023 05:28:13 -0700 (PDT)
Received: from krzk-bin ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id n7-20020aa7c787000000b0050bc6c04a66sm4362518eds.40.2023.05.30.05.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:28:13 -0700 (PDT)
Date:   Tue, 30 May 2023 14:27:48 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     pabeni@redhat.com, robh+dt@kernel.org, geert+renesas@glider.be,
        conor+dt@kernel.org, magnus.damm@gmail.com, netdev@vger.kernel.org,
        kuba@kernel.org, davem@davemloft.net, s.shtylyov@omp.ru,
        edumazet@google.com, krzysztof.kozlowski+dt@linaro.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 1/5] dt-bindings: net: r8a779f0-ether-switch:
 Add ACLK
Message-ID: <20230530122748.y2oiv6qb7yxnh6kx@krzk-bin>
References: <20230529080840.1156458-1-yoshihiro.shimoda.uh@renesas.com>
 <20230529080840.1156458-2-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230529080840.1156458-2-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 29 May 2023 17:08:36 +0900, Yoshihiro Shimoda wrote:
> Add ACLK of GWCA which needs to calculate registers' values for
> rate limiter feature.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../bindings/net/renesas,r8a779f0-ether-switch.yaml    | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1786990


ethernet@e6880000: clocks: [[12, 1, 1505]] is too short
	arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb
