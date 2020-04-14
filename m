Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65411A8E1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2020 23:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732193AbgDNV41 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Apr 2020 17:56:27 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44868 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729713AbgDNV4Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 17:56:24 -0400
Received: by mail-ot1-f67.google.com with SMTP id j4so1313936otr.11;
        Tue, 14 Apr 2020 14:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+o2yriNr4v3rniMWdemUISKQYsPGQxqAvPZbiefW6UE=;
        b=pLFnVXLsZjSdzzf8JdCaeDAHmIwbidkhQ8EWRTpNDF2BNk7PK1Nrp3cj5+Ssl4YhsT
         gY54BXPDpshu0Rp3DfYUqAu4dkGboRKwJx8b5kg23KqQG7suATZOLdo44Vi3ClT7bpzM
         XptMeYnTaBoKjl+Tx3tjQ9ngsAHkmsSS+SiwqU+8Mev8Ye02ebREfgAuL63FG9w1e4Cu
         m+rKdvJDyG5f5MVeBp4vvH7KF972TJ5JCvj3vkrvx8GX6Z9SItvlWFXMAbOTjoiYs3hJ
         YxK+jbN4KHveJctGjszEUs6y6mRzdHrWfqLRx2V1ft3zEpzgqjDt1TpcbRD2P0h3rx8S
         iGWQ==
X-Gm-Message-State: AGi0PuYF4qhtmnYRtiQ9eR+WG4BsEUEE4Y4DyLI7GzDDqrJam/4+K8ml
        +a3fpHKd/2ReS06EVEuzKV3TljQ=
X-Google-Smtp-Source: APiQypLhFPB4rMGpKjdNYF2xubgNfmpg+NIvA1YQpl0vgKNyYqbR+tf3if9hzLDvVOEv6qMG8K/tig==
X-Received: by 2002:a05:6830:60b:: with SMTP id w11mr18023314oti.96.1586901383492;
        Tue, 14 Apr 2020 14:56:23 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r24sm5890903otq.9.2020.04.14.14.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 14:56:22 -0700 (PDT)
Received: (nullmailer pid 31154 invoked by uid 1000);
        Tue, 14 Apr 2020 21:56:21 -0000
Date:   Tue, 14 Apr 2020 16:56:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/4] dt-bindings: display: bridge: Reject additional
 properties in ports node
Message-ID: <20200414215621.GA31081@bogus>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200405232318.26833-2-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon,  6 Apr 2020 02:23:15 +0300, Laurent Pinchart wrote:
> Document the #address-cells and #size-cells properties of the ports node
> in the schemas of the bridge DT bindings, and set additionalProperties
> to false to reject additional properties.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/bridge/anx6345.yaml       | 8 ++++++++
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml    | 8 ++++++++
>  .../devicetree/bindings/display/bridge/ps8640.yaml        | 8 ++++++++
>  3 files changed, 24 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
