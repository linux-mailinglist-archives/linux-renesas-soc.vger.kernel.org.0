Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45BB7B7D61
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2019 16:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388183AbfISO7m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 10:59:42 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36834 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387407AbfISO7m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 10:59:42 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0C32D25B76F;
        Fri, 20 Sep 2019 00:59:40 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1CE0F94444E; Thu, 19 Sep 2019 16:59:36 +0200 (CEST)
Date:   Thu, 19 Sep 2019 16:59:36 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: bus: simple-pm-bus: convert bindings to
 json-schema
Message-ID: <20190919145933.cf7ae53dtiofwmlh@verge.net.au>
References: <20190916153357.3880-1-horms+renesas@verge.net.au>
 <20190916153357.3880-2-horms+renesas@verge.net.au>
 <20190917112937.g3jna2kc7rw7zynd@verge.net.au>
 <CAL_JsqJmfrPZA7=uWG_DOOzFsLsHeg2=+86d_91mnmyv9UeLJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJmfrPZA7=uWG_DOOzFsLsHeg2=+86d_91mnmyv9UeLJg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 17, 2019 at 07:48:17AM -0500, Rob Herring wrote:
> On Tue, Sep 17, 2019 at 6:29 AM Simon Horman <horms@verge.net.au> wrote:
> > On Mon, Sep 16, 2019 at 05:33:56PM +0200, Simon Horman wrote:

...

> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +       - const: simple-pm-bus
> >
> > The following patch, for Renesas BSC, also
> > describes the simple-pm-bus but also requires other compatible
> > strings to be present.
> >
> > In order to facilitate that I tried the following:
> >
> >    compatible:
> >       contains:
> >          const: simple-pm-bus
> >       additionalItems: true
> >
> > This allows make dtbs_check DT_SCHEMA_FILES=.../simple-pm-bus.yaml to pass
> > in cases where there are more compat strings pesent. However
> > make dtbs_check DT_SCHEMA_FILES=...renesas,bsc.yaml (schema file
> > introduced in following patch) fails in the case
> > where the only compat string is simple-pm-bus.
> >
> > make dtbs_check DT_SCHEMA_FILES=...renesas,bsc.yaml also fails
> > due to the reg property not being present for the same compat case,
> > which should be valid according to simple-pm-bus.yaml.
> >
> > Does anyone have any guidance on how to proceed?
> 
> You'll need a custom 'select' in renesas,bsc.yaml that leaves out
> "simple-pm-bus". See "panel-lvds" users in linux-next for an example.

Thanks, I think I have that working now.
