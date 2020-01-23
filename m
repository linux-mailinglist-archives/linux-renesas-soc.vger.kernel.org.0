Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D88CA146B85
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2020 15:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbgAWOl6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jan 2020 09:41:58 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33050 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgAWOl5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 09:41:57 -0500
Received: by mail-oi1-f194.google.com with SMTP id q81so3127466oig.0;
        Thu, 23 Jan 2020 06:41:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XyyEYmd6rzPdE4SjzNvt9zLoM4bcWk4jZl+F6inRdac=;
        b=F/1+xwwP/Y/0+1RrHcYRcVgMnQohCYtrTwnvPU+cmHRezE4bR0TZ9xlL7wjSo9st75
         rwrgILMWbx4eNcfOOIXbmlHhZ2J81PszH+UC9Nqyp8gEy0jQm3Uq2VhZMxF6DQ3wFg9m
         Q3WarnfP42ZPq13cZeQ76/CYaFnl5XXLyINPYBrn6owZT5zXXk5gHVVACZ1rrz7hJFC0
         BVvjQofzM4aozLzsQ91bmr0K8E+H9RrbEdZu5c7MEw7baJZiDjt0+ATlzHe+jy4AU7z9
         pXmcH6f9tgIIAQsrRjis2pAdKWjO0Q9H2AsaanfKWELI6DGO/eBUON5C1OVwDw/8DiWq
         uF+w==
X-Gm-Message-State: APjAAAWYOVEh3meDRPVso2PO9HhQzjNlIWgCesdfDY3EIuQWFg9SWmK9
        6ljRyJ2ax3/OjtsjgMgO9w==
X-Google-Smtp-Source: APXvYqzBkE5Rv9HPj5Qd04PviHLLr7khBD4hO9ohPV1CuplqS7AN8jQmX3T8AbcYgjI08E1/d+keNA==
X-Received: by 2002:aca:2118:: with SMTP id 24mr10597649oiz.28.1579790517079;
        Thu, 23 Jan 2020 06:41:57 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k17sm846309otl.45.2020.01.23.06.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 06:41:56 -0800 (PST)
Received: (nullmailer pid 8536 invoked by uid 1000);
        Thu, 23 Jan 2020 14:41:55 -0000
Date:   Thu, 23 Jan 2020 08:41:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     David Lechner <david@lechnology.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: restrict properties for sitronix,st7735r
Message-ID: <20200123144155.GA29553@bogus>
References: <20200115124548.3951-1-geert+renesas@glider.be>
 <20200115124548.3951-2-geert+renesas@glider.be>
 <ba21d2c8-ccc6-2704-fa1f-d28239700547@lechnology.com>
 <20200120190249.GA9619@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120190249.GA9619@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 20, 2020 at 08:02:49PM +0100, Sam Ravnborg wrote:
> Hi David.
> 
> > > +allOf:
> > > +  - $ref: panel/panel-common.yaml#
> > 
> > not all of these properties are applicable.
> > 
> 
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - dc-gpios
> > > +  - reset-gpios
> > 
> > Missing optional rotation and backlight properties.
> 
> Thanks for catching this. I have written a little .yaml files
> since I applied this - and learned a little more of the syntax.
> 
> See attached patch for my attempt to fix this.
> Please review.
> 
> 	Sam
> 
> From 6b54fb0a071c0732cd4bd5b88f456b5a85bcf4f2 Mon Sep 17 00:00:00 2001
> From: Sam Ravnborg <sam@ravnborg.org>
> Date: Mon, 20 Jan 2020 19:55:04 +0100
> Subject: [PATCH] dt-bindings: restrict properties for sitronix,st7735r
> 
> David Lechner noticed (paraphrased):
> - not all properties from panel-common are applicable.
> - missing optional rotation and backlight properties
> 
> Fix this by listing all allowed properties, and do not allow other properties.
> 
> Fixes: abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to DT schema")
> Reported-by: David Lechner <david@lechnology.com>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: David Lechner <david@lechnology.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  .../devicetree/bindings/display/sitronix,st7735r.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
