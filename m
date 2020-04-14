Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707811A8E2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 00:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407827AbgDNWBr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Apr 2020 18:01:47 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33193 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407796AbgDNWBo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 18:01:44 -0400
Received: by mail-oi1-f193.google.com with SMTP id m14so11859973oic.0;
        Tue, 14 Apr 2020 15:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G6PPt1QnSaN0ApJ5RR4KQrnjQemnxVXWfSc9EvEQLP0=;
        b=HIU3oT0u1HtkY++Yy/2TD8Np7hTmvAw95e7eOJZ6ZQUiAj0qin6zOhO2yFHdnjOHHC
         NrlcZTbRTe91FwmgTXbGol9/th9XJgg2KHYTIgWAfhfgqOa6WVoUX1L84K/lEX6PYcuU
         pFcbR5l+ZhIqMGBN1ookq543AqajUyR50JgnKkWYgt2r0MUV2GpKNsa7Sn10luh4RQ6x
         6lW5GmzhZSoY61cISvvuc+N2g64tcnBNWuDGFJFiBo+Bu/y6B9kYwYxEAj7zMt4wDk8w
         3R+HRL0Jy2ZCueaH/wd+lPoAxupC7rx7ofIEDRvCurPlO8FabsKfe/mWFd4KG/f3X08N
         8low==
X-Gm-Message-State: AGi0PuZBJQ5C+kZz7chWXgVU5OzkwoAenWzlrIpGoeufYRKlosSLtrqp
        kRQMsws9JQPi8f4d8IJklym/wQs=
X-Google-Smtp-Source: APiQypJgNGOt5RJHf7DTmxuYa6cjzVowN5sTDAOvfa5ylnYX6d3lhAnN5erFU66Pa0EwwqBW8CNfUw==
X-Received: by 2002:a05:6808:181:: with SMTP id w1mr3029236oic.26.1586901701741;
        Tue, 14 Apr 2020 15:01:41 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y8sm3631228otg.6.2020.04.14.15.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 15:01:41 -0700 (PDT)
Received: (nullmailer pid 6545 invoked by uid 1000);
        Tue, 14 Apr 2020 22:01:40 -0000
Date:   Tue, 14 Apr 2020 17:01:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 3/4] dt-bindings: display: bridge: thc63lvd1024: Convert
 binding to YAML
Message-ID: <20200414220140.GA6489@bogus>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200405232318.26833-4-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon,  6 Apr 2020 02:23:17 +0300, Laurent Pinchart wrote:
> Convert the Thine THC63LVD1024 text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../display/bridge/thine,thc63lvd1024.txt     |  66 ----------
>  .../display/bridge/thine,thc63lvd1024.yaml    | 121 ++++++++++++++++++
>  2 files changed, 121 insertions(+), 66 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
