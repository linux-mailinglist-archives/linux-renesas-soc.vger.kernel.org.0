Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9012D5110
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 03:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbgLJCxE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Dec 2020 21:53:04 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44717 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727885AbgLJCxA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Dec 2020 21:53:00 -0500
Received: by mail-oi1-f193.google.com with SMTP id d189so4132825oig.11;
        Wed, 09 Dec 2020 18:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xhxG/mo7q9opoMwDswdlM9NEH3tPDtUI59Wb0QTSbXk=;
        b=PQDQrG7Zck5Jq3B2LT3WrbfbnZZLDNXTCuRi59w9c1etPVhst2BHqi2LkziljiGn1y
         3oPxCtSIILTWVTesE5ORAKPF5np/HEZ3o7RC5ISXZBQbmWah4bDj5uhrJtCxCTEQ9jV1
         XtsiVZwS1G+8CJoK1Bt5psSKz0g2cdy99b2HbPxxb0dmRfqfMcECsFK+DIhW//AQXBjK
         nv7EdX3lu1zu+JC4qosCdEZe5HxraCs4MWX6S7zUWOYXtR6wo1RQe5isdINfxKr/VHYm
         aVCYK1qsE13cTmFgO5/oCA1LVuscqRPPJ4k3LACe44eI6zNBqUIYYQoy2qCzK8PUxJN7
         99RA==
X-Gm-Message-State: AOAM530b9QxqYWak0/K54dgMQ+bRgB0RJu7HIFqOO2sSexaUYEtohTVx
        2nzMYj19dldS0BvHE52SveJIvFce8Q==
X-Google-Smtp-Source: ABdhPJwXEDSfvURjSfDEoy/luTtCiE7hawE1c2TMbcQaA8POKJ0MQjESHqQr5ymXNUaJ4h8SD4MfgQ==
X-Received: by 2002:aca:518c:: with SMTP id f134mr4243675oib.108.1607568739441;
        Wed, 09 Dec 2020 18:52:19 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q184sm713648oic.41.2020.12.09.18.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 18:52:18 -0800 (PST)
Received: (nullmailer pid 1547048 invoked by uid 1000);
        Thu, 10 Dec 2020 02:52:17 -0000
Date:   Wed, 9 Dec 2020 20:52:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: renesas,tmu: Document missing Gen3
 SoCs
Message-ID: <20201210025217.GA1546993@robh.at.kernel.org>
References: <20201209195624.804759-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201209195624.804759-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 09 Dec 2020 20:56:24 +0100, Niklas Söderlund wrote:
> Add missing bindings for Gen3 SoCs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
