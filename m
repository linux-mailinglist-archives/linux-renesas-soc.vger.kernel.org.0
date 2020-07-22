Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2731229325
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jul 2020 10:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgGVIKB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jul 2020 04:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbgGVIKB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jul 2020 04:10:01 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF60DC0619DC
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Jul 2020 01:10:00 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id w9so1227956ejc.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Jul 2020 01:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8/oqCUNmFc1OqEXIlUblc8Jp0aa/CFYxFmL2eg8Khmw=;
        b=Ii92gK2l3xsjB7pc4zpJzWubUCqWxaXjaGz1827ZLCYraTZxLI4GEXebasVLB3raxd
         wZJky5lLRe1rG9dscfydrF0dm1kNwnqgAYnY/3d+QFiJ5FLNDduQYcSlNbi8A6c+hx8y
         CMQ7YTioQyWvZ58SIDmp13HKuqAcIahEawSKmLIUkXZFAGP7AlJ9epnj8TyhUz4jPBGc
         fnaV9dGFbwM5PHac4f+dsTHjzhdh5Osyv1qU+uHGVZTHuAtIhf62pzyqyuIzc5EZNAjg
         yLFKrzGWu3gTBfTq/CQpP+sJRVgukDv6YCw8FAWlsZGXAfOc7ZuQZAS7rrLaazG5V1Ks
         YsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8/oqCUNmFc1OqEXIlUblc8Jp0aa/CFYxFmL2eg8Khmw=;
        b=hxill2n140wuFnrsTjmMYQVlmq5Phlx7e8q8kh8aMRtEZzeygZqu5ZrevLVGjtxLN+
         8weMqKsQ07ey74dw2tt5/MRD8KyxkIXXcn9q4KCje4oWVtyH1jlM58HIsIRJL+JPq0lD
         fzh9Gn1ifxFSwrlOQjHD8vwdtZ74HRklzCxCF4l5aCsj2ghmviSp8c8otgNv+gUd1oN0
         GE6tTvF2J9Li2wal4BF6LcbWK8tm2FPRAN3CaLSgJDBCUoBQabchISwAMjjZfoV+rYEv
         qaObxxNbTtb4n5u70yNA+qrkTE/4Y26ExMKZezI/DpKjx0PZ6SdSomQCG1WiY+XgqCPk
         rfLA==
X-Gm-Message-State: AOAM532p2CDBBqSYDc4Y25Ork+hj4yDk1OIYWCm5qE5cY9wRum9OO2td
        aX5dDGSuymt5GwB9Dmndq1nLY0Z3hYNYpRbruFe2Xg==
X-Google-Smtp-Source: ABdhPJy0jQhddfBD9VXXPKyqiTXDORIrWINJapjugf6TEhdbEYQZQa7Fm4tW9glCGrENg3DnQz945cD77jRoWWq1Rdw=
X-Received: by 2002:a17:906:2296:: with SMTP id p22mr28296124eja.510.1595405399348;
 Wed, 22 Jul 2020 01:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-3-jacopo+renesas@jmondi.org> <20200717193509.GD5961@pendragon.ideasonboard.com>
In-Reply-To: <20200717193509.GD5961@pendragon.ideasonboard.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 22 Jul 2020 10:14:52 +0200
Message-ID: <CAMZdPi-wOmbMi-BxB31HoDhcBSxoSnFssceb=KR2Q=SeU9rN=w@mail.gmail.com>
Subject: Re: [PATCH 02/13] arm64: dts: qcom: apq8016-sbc: Fix CSI-2 lanes routing
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 17 Jul 2020 at 21:35, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jacopo,
>
> On Fri, Jul 17, 2020 at 03:28:48PM +0200, Jacopo Mondi wrote:
> > The ov5640 sensor does not support lanes reconfiguration according
> > to version of the datasheet I have (version 2.03) and the driver
> > does not parse the properties to try to reconfigure them.
> >
> > Fix the properties values in the camera and cci node.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> > Loic, I see you added the camera nodes in
> > 39e0ce6cd1bf ("arm64: dts: qcom: apq8016-sbc: Add CCI/Sensor nodes")
> >
> > Do you have any idea how lanes could be swapped if, from my understanding,
> > nor the sensor nor the driver supports that ?
>
> It's not supported on the OV5640 side, so I think the second hunk of
> this patch is correct, but I believe that the CAMSS supports lane
> reordering, so the first hunk is likely incorrect and should be dropped.

Indeed, camss supports lane configuration (cf camss_of_parse_endpoint_node).
The sensor doesn't, so that can be removed on its side.

Regards,
Loic

>
> > ---
> >  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > index 8a4b790aa7ff..fe6613676e45 100644
> > --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > @@ -591,8 +591,8 @@ ports {
> >               port@0 {
> >                       reg = <0>;
> >                       csiphy0_ep: endpoint {
> > -                             clock-lanes = <1>;
> > -                             data-lanes = <0 2>;
> > +                             clock-lanes = <0>;
> > +                             data-lanes = <1 2>;
> >                               remote-endpoint = <&ov5640_ep>;
> >                               status = "okay";
> >                       };
> > @@ -627,8 +627,8 @@ camera_rear@3b {
> >
> >               port {
> >                       ov5640_ep: endpoint {
> > -                             clock-lanes = <1>;
> > -                             data-lanes = <0 2>;
> > +                             clock-lanes = <0>;
> > +                             data-lanes = <1 2>;
> >                               remote-endpoint = <&csiphy0_ep>;
> >                       };
> >               };
>
> --
> Regards,
>
> Laurent Pinchart
