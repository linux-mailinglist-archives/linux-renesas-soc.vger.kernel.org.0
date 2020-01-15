Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 105CF13B65B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2020 01:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbgAOAIT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jan 2020 19:08:19 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43687 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgAOAIS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jan 2020 19:08:18 -0500
Received: by mail-oi1-f194.google.com with SMTP id p125so13693252oif.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jan 2020 16:08:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=PEMFQk9O8jxAvzI8sFAtYfnpYGHToC52icRpafkpCkM=;
        b=ew+oBQ3gG8PORP9gBIyCDvknBsfp8NbF6tIMuM0oIG/wMIsBvSwGEsKrTYYMLIN8vW
         vLYVRf77FpbcbVwu4igEboxcSianz0Qhm6LH+Q0bSa2pLO56hUxhJt/9VAiBVmlJQp69
         f0a7+CFyySCU2o+Oq7L3fB0DvlijErwdUqrBMcaAGklWeheMGXwLeusrkdcLJMo+XcaD
         xS+w9aBnEda+ooce0/gBfHWSr74AyZeduhDZYhL317qOwZwSzX7QxFG7gyBmXS712Cqi
         scuPfbcsgultVTAhP1V5RQZL0zG6GsqvE2mejTePaqReyrFkMh+IT2RsKZjZDWzA13F9
         //Iw==
X-Gm-Message-State: APjAAAXEMOa5VYNU0aFXFcl8XAwdC6SJZfDpj66+84VmwGKa6P2CZ6kA
        UnlbxJXrFh7BpUGDMAlYD6u8eNg=
X-Google-Smtp-Source: APXvYqyWMt0Sg6YaAE9i7MlpE/BY1kHrv903GEtBtEwWV1Mm8KMp2yQTgsF8a5dxunyGjnQignDirA==
X-Received: by 2002:aca:190b:: with SMTP id l11mr19650998oii.65.1579046897375;
        Tue, 14 Jan 2020 16:08:17 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i6sm5093707oie.12.2020.01.14.16.08.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 16:08:16 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2209ae
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 18:08:16 -0600
Date:   Tue, 14 Jan 2020 18:08:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2] dt-bindings: rcar-csi2: Convert bindings to
 json-schema
Message-ID: <20200115000816.GA10876@bogus>
References: <20200108215209.1825544-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200108215209.1825544-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed,  8 Jan 2020 22:52:09 +0100, =?UTF-8?q?Niklas=20S=C3=B6derlund?= wrote:
> Convert Renesas R-Car MIPI CSI-2 receiver bindings documentation to
> json-schema.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../bindings/media/renesas,csi2.txt           | 107 ----------
>  .../bindings/media/renesas,csi2.yaml          | 198 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 199 insertions(+), 108 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,csi2.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,csi2.yaml
> 

Applied, thanks.

Rob
