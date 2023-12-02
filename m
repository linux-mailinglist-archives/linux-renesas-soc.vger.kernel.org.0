Return-Path: <linux-renesas-soc+bounces-557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FA9801EB3
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Dec 2023 22:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E95181C20831
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Dec 2023 21:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F7D22310;
	Sat,  2 Dec 2023 21:40:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 913CBF3;
	Sat,  2 Dec 2023 13:39:59 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6d8769552a7so621057a34.1;
        Sat, 02 Dec 2023 13:39:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701553199; x=1702157999;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YzCl70xi9QPn/aOyRJUNA37xvpSbMCd83iLbXMsuFRU=;
        b=hppTJdHL8Kud6rUC24TZ2bo6bXhW5TyuTjTatHiPkGIoTzYPerDDbnaXnNoYfdTOZl
         a06I4Qkx2YCtiMRrpHSUMurNMq+WpNtr0uJa9myoBMNQDbgXTsYQ8biV5ZjxRvdtP1g0
         XGEO7rSKcY9wsFAZq2pjq2d6/do4wnOklNz9bupsPSKhm9z7edalK0jrYNDWg1uOpA5F
         zppFcsfsG8KtDVc9j8IIg7J153L5xwXEDklnwoZY0Enx+39NnnVfgGk4mgShAvxwrw4U
         s6Pl+U+ndunKOM/WZTxjhC8doA2tKtHoB765Iqvb3ldK18tHGOgEVPmARM8wiZltMnBs
         m03Q==
X-Gm-Message-State: AOJu0YxF1KGtCHG+wp5t6zh8BxqDRyTINHVI+Xtdf41qbIeKp2n7uxau
	m1EWTtsq35+L3+MAzzWyWg==
X-Google-Smtp-Source: AGHT+IF/udTVdI8DnZMlwKgZtpP7HL1Jl0RxPqhtT68cbdm6MthSKrESk0+ZNE7FObC62fRn+x1CwQ==
X-Received: by 2002:a9d:7618:0:b0:6d8:7cf8:a071 with SMTP id k24-20020a9d7618000000b006d87cf8a071mr786975otl.15.1701553198535;
        Sat, 02 Dec 2023 13:39:58 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p21-20020a9d7455000000b006d81471c92dsm1022640otk.41.2023.12.02.13.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 13:39:57 -0800 (PST)
Received: (nullmailer pid 438826 invoked by uid 1000);
	Sat, 02 Dec 2023 21:39:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Biju Das <biju.das.au@gmail.com>, Lee Jones <lee@kernel.org>, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor+dt@kernel.org>, Steve Twiss <stwiss.opensource@diasemi.com>, Support Opensource <support.opensource@diasemi.com>
In-Reply-To: <20231202192536.266885-12-biju.das.jz@bp.renesas.com>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-12-biju.das.jz@bp.renesas.com>
Message-Id: <170155319496.438806.9502975986824845305.robh@kernel.org>
Subject: Re: [PATCH v2 11/11] dt-bindings: mfd: dlg,da9063: Convert da9062
 to json-schema
Date: Sat, 02 Dec 2023 15:39:54 -0600


On Sat, 02 Dec 2023 19:25:35 +0000, Biju Das wrote:
> Convert the da9062 PMIC device tree binding documentation to json-schema.
> 
> Update the example to match reality.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/mfd/da9062.txt        | 124 ------------
>  .../devicetree/bindings/mfd/dlg,da9063.yaml   | 184 +++++++++++++++++-
>  2 files changed, 178 insertions(+), 130 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/da9062.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.example.dtb: pmic@58: 'gpio' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.example.dtb: pmic@58: 'onkey' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.example.dtb: pmic@58: 'rtc' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.example.dtb: pmic@58: 'watchdog' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/da9062.txt
Warning: Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/da9062.txt
Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml: Documentation/devicetree/bindings/mfd/da9062.txt
Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml: Documentation/devicetree/bindings/mfd/da9062.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231202192536.266885-12-biju.das.jz@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


