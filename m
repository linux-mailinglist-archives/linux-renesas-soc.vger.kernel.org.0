Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 108F57BFADF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Oct 2023 14:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbjJJMLp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Oct 2023 08:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbjJJMLp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 08:11:45 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC22B9D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 05:11:41 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d81dd7d76e0so6457512276.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 05:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939901; x=1697544701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+q8X53t6/nAULKwb/iQeHBUqOXFycHH5TaG/WC1vrU=;
        b=KGKmxhgMP4P3IQJ/iGhtpYpiJ6q3uSNdweJXBRuZwa4UKU/nOrdgNJsi20F1w4WZNF
         l+qpw1x2Kd8wTmFWYu1+06HOCKk7FkoJqWHDn7IUTHhXocB44EZCBO6VJAZRJ0sXSvNX
         bkhWe1RLSXnRLjSy6y4aVXlZrKps30OtwITFamPtgD5Qn5D5gNiCrcbQhrTW73XVUUl/
         OoSk9+Q2fp0YBYruI/BmW/gH7njJmIYgvmDaVBW41O75vCsbClyGwuJ8x2yxZzreXgwG
         2gcmKsBb1IG/8vM7Vpiu+7EJuUNhCNCTFQ1AD/wAe45p6gWo7QzovAPUf/0AixfFPYUM
         Rdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939901; x=1697544701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+q8X53t6/nAULKwb/iQeHBUqOXFycHH5TaG/WC1vrU=;
        b=LQgOzMNpjhECvfBmI8NRc1knzsJvWLCRkqLfFu5301J2lnx+eVlLZE121fPyL+HL5X
         +zirNXnn25vTMcxrwVOr/T+yg+8AtoyiLfRoqL0K2SDlt11YMqxtxUKroH9iqk7zXH7v
         xihOTI1sF/qxJ/CIT49MVo2ppV+2wDciR37IPA9jUk8uM39TE7El+ng/9kws0TI+sETE
         ews3nLyvsOpi2cnfChZ/At7fVxYH4xkicfEfG+0FUCOvRmztEhmzvemVe1tlBG3/pTdt
         5FKI9SgeXGQIoRKPVv9yFU4dDyGjSmd23sZ7OfyaMSU9TqCTtekTNc+I1dAOWS/iF7yu
         5mkw==
X-Gm-Message-State: AOJu0Yzea0slh6RMYMfgmFRy3gr14+po46SUzj3f3Sx+3LVZq+V8ppN1
        fIWFrNlbXYdHkYaRUoQOuuOxH/C4V3gRklUOV8gyaA==
X-Google-Smtp-Source: AGHT+IHY62VCVtolYEhTBCIC57nxmItuoQHuHYu3sYeMnpAunQnYQ8ZtY1uLV0kYVpGVCOXn9wxAiQn5CWxRf+sQLyM=
X-Received: by 2002:a25:800a:0:b0:d9a:5c10:d7f7 with SMTP id
 m10-20020a25800a000000b00d9a5c10d7f7mr1507482ybk.60.1696939901112; Tue, 10
 Oct 2023 05:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231006082247.3830719-1-martin@kaiser.cx>
In-Reply-To: <20231006082247.3830719-1-martin@kaiser.cx>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 14:11:30 +0200
Message-ID: <CACRpkdY9md81_GHN8kKJhCE9GbW6k5tRLavaQ4DJtYCf+C11+Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: st,stm32: fix phandle-array warning
To:     Martin Kaiser <martin@kaiser.cx>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Oct 6, 2023 at 10:27=E2=80=AFAM Martin Kaiser <martin@kaiser.cx> wr=
ote:


> make CHECK_DTBS=3Dy st/stm32f469-disco.dtb
>
> brings up a warning about a missing argument:
>
> stm32f469-disco.dtb: pinctrl@40020000: st,syscfg:0: [21, 8] is too short
>
> The description of the third entry indicates that this entry is optional.
> The code in stm32_pctrl_dt_setup_irq parses st,syscfg and treats the thir=
d
> entry as optional. It defaults to 0xf if not present in the devicetree.
>
> Update the schema to require at least two entries, use the same syntax as
> the description of renesas,ipmmu-main in
> Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Patch applied!

Yours,
Linus Walleij
