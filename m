Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF7BBBED6B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 10:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfIZIca (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 04:32:30 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:51192 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfIZIca (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 04:32:30 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C6FCB25B82A;
        Thu, 26 Sep 2019 18:32:28 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CD517943750; Thu, 26 Sep 2019 10:32:26 +0200 (CEST)
Date:   Thu, 26 Sep 2019 10:32:26 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8996: Update simple-pm-bus
 node name to 'bus'
Message-ID: <20190926083226.tb5tgo74xg2n3udp@verge.net.au>
References: <20190924093609.22895-1-horms+renesas@verge.net.au>
 <20190924093609.22895-4-horms+renesas@verge.net.au>
 <3d9dcd04-b34d-957e-6269-cf39a15b4b27@cogentembedded.com>
 <dbfc721b-ca66-edb4-aa87-13e15a9a68f8@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbfc721b-ca66-edb4-aa87-13e15a9a68f8@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 24, 2019 at 01:18:30PM +0300, Sergei Shtylyov wrote:
> On 09/24/2019 01:15 PM, Sergei Shtylyov wrote:
> 
> >> Update simple-pm-bus node name from 'agnoc' to 'bus' reflecting the
> >> proposed binding description in json-schema which in turn reflects the ePAR
> > 
> >    It's ePAPR. BTW, you can now refer to DT spec itself instead -- it was based
> > on ePAPR...
> 
> https://www.devicetree.org/specifications/

Thanks Sergei,

how about this?

  arm64: dts: qcom: msm8996: Update simple-pm-bus node name to 'bus'

  Update simple-pm-bus node name from 'agnoc' to 'bus' reflecting the
  proposed binding description in json-schema which in turn reflects the
  Devicetree specification [1] v0.3-rc2. 

    "The name of a node should be somewhat generic, reflecting the function
     of the device and not its precise programming model. If appropriate,
     the name should be one of the following choices:
       ...
       * bus
       ..."

  Also drop the unit address as there is neither a reg property nor
  non-empty ranges.

  [1] https://www.devicetree.org/specifications/

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
