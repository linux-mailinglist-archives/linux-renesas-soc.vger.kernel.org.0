Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4F7242F17
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Aug 2020 21:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgHLTVj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Aug 2020 15:21:39 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:41155 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbgHLTVj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Aug 2020 15:21:39 -0400
Received: by mail-il1-f196.google.com with SMTP id q14so3016038ilj.8;
        Wed, 12 Aug 2020 12:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lrFi5UUsx7Z7b7tkGVje9KNF6Ch0mT52ynZKiKuVK+U=;
        b=AgJvdfNQuN2M45a5oKFMgtzcDnZAxDz9AeWQtRWWRfkuGclLPYpexSDbLkbxloa9KB
         MqS6NoAqI6b87qjLJGBms2rKYS1vz7Nbe7ijU8kDLvEdouYFfmaUfS9lhKcOML0imTlP
         BX/5wfx7IgGZzM85OzADQAcb+hHfMaWi5fbinX0+TP4S64lA2nXiSvp7HixPD+iLQ5kb
         Lps1dhwZeU77ufRMQOtNdsyr48nOJfoWMCfr8ujeBbdY9p7rGYPM5xB8WFI31m3Y0XeV
         +32z9PDz8ispaQffrDiPwvfAYEECAPzIT+JVc20DVL5+rRga806RmUECyJ5XrG8YnYWF
         Vsiw==
X-Gm-Message-State: AOAM5334teG/gGvDl3XiVyK+lgD/sATxqJ67bnsyy5MWsI60ncT1C9Jq
        Ofn65AWMWAKs7qJsYKI/2A==
X-Google-Smtp-Source: ABdhPJykPZj78iUAp6YsuQlqpTP0k0Ddxs1kxAkGLFZni5Q/fLkJt2crn0iPw2GXVYUWPlfS2fwbAA==
X-Received: by 2002:a05:6e02:de4:: with SMTP id m4mr1071933ilj.156.1597260097540;
        Wed, 12 Aug 2020 12:21:37 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b23sm1411574iof.29.2020.08.12.12.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 12:21:36 -0700 (PDT)
Received: (nullmailer pid 2557433 invoked by uid 1000);
        Wed, 12 Aug 2020 19:21:35 -0000
Date:   Wed, 12 Aug 2020 13:21:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: adv7604: Convert bindings to
 json-schema
Message-ID: <20200812192135.GA2557381@bogus>
References: <20200801161825.96837-1-niklas.soderlund+renesas@ragnatech.se>
 <20200801161825.96837-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200801161825.96837-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 01 Aug 2020 18:18:24 +0200, Niklas Söderlund wrote:
> Convert ADV7604 video decoder documentation to json-schema.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v2
> - Ensure main comes first in reg-names.
> - Add additionalProperties false.
> 
> * Changes since v1
> - Simplify enum for reg-names.
> ---
>  .../devicetree/bindings/media/i2c/adv7604.txt |  87 ---------
>  .../bindings/media/i2c/adv7604.yaml           | 178 ++++++++++++++++++
>  2 files changed, 178 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
