Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24DA21E5417
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2020 04:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgE1CmK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 22:42:10 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:45605 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725896AbgE1CmK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 22:42:10 -0400
Received: by mail-io1-f67.google.com with SMTP id y5so5554426iob.12;
        Wed, 27 May 2020 19:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b/oNRFbWcA9UKdCn5+v8TysbsT9eF8fH1Ja8+nqZDmU=;
        b=TYtTBoB4jrxgSYEfeshp9+E2TU4M48JZqqftSh9EbsTahzQGdvQVKu1qoojSJg4xyr
         UhVAWmLg1i7Hs0AzMJIIIrsLssqfzJ4OmQFgpg9kO6gvtF8bk43p0HtC/UyCWu9ar0fM
         /qqSRscKUcSdP+pipRBJs0Ykcx5S8+ZBqnv9EpsJHoAz6nMyoMbrs3zNrht9BFjNMjCb
         kq3nZf/uoWCMqoX9tscUd6OsRMOB1jEQ3gC24469hbw3SweUTwCgcAGk2OyKhAiH/vdJ
         Ij6KF4QuFxyw1q9T7uZ7ucLQGzqqYklni9KtvU0EJm4R/EBCzzDNEgcKKAb8WJQZrS4o
         FgHw==
X-Gm-Message-State: AOAM530Ym1DZ4OZFjqWW3ozxuCaoz2xvXMHeAP9WA6QT7Wa9LLk5Tdok
        7D2Xyidj/YIoOMvY3KK3J2Cu2Eg=
X-Google-Smtp-Source: ABdhPJzKlFiW8HM67DLDFC6JfQlSVeYAE3EzxuQizHFJK24jCTp1VdyCqhMig8TKRQg5EZ+n1bEodQ==
X-Received: by 2002:a05:6602:2f06:: with SMTP id q6mr693015iow.135.1590633729485;
        Wed, 27 May 2020 19:42:09 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id d12sm2665990ill.80.2020.05.27.19.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 19:42:08 -0700 (PDT)
Received: (nullmailer pid 3261346 invoked by uid 1000);
        Thu, 28 May 2020 02:42:08 -0000
Date:   Wed, 27 May 2020 20:42:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 5/4] dt-bindings: display: bridge: thc63lvd1024: Document
 dual-output mode
Message-ID: <20200528024208.GA3261299@bogus>
References: <20200406111543.GC4757@pendragon.ideasonboard.com>
 <20200513232127.21798-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513232127.21798-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 14 May 2020 02:21:27 +0300, Laurent Pinchart wrote:
> The DT binding support both dual-input and dual-output mode, but only
> dual-input is documented. Document dual-output mode.
> 
> Suggested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../display/bridge/thine,thc63lvd1024.yaml       | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
