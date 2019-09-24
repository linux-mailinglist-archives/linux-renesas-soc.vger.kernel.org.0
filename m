Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B87FBC596
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2019 12:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394570AbfIXKSe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Sep 2019 06:18:34 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43047 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394079AbfIXKSe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 06:18:34 -0400
Received: by mail-lj1-f194.google.com with SMTP id n14so1273814ljj.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Sep 2019 03:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dvyG2HikKVAqZ3Pld7hfYovEOH+8ytMaQq67ZyyM48o=;
        b=KrWowQDim4LdLuvtdMub1Ygah7hcu65lQQ2FDcTtYa8G8GpmtZ/C/Z5uRKUmZq0jc0
         H9GD5KAMb8dYv9AJ8LJep07ridsxImrFsrLd8Oy8iI5yAgbA0c+7ybCzN3QPK+qjCpsC
         aqaJakUC/rLPZT8GtAokN6DUmc2ZugnGHE3l/atlYeq4BIzlI/kMphXJhNcH/5ofv208
         NWnjdgHX5tnHqYsNnhNDInTUg98uF8pLDEzUX5UwH3HTheVBgE8Vb9wlx+qMv52jfnVD
         i8Np/zcSi+BolAr/ZVbjic4hRR5U09iGCBeUV5f1s4rfP8Qp09z8g55bvtQ/z7jtePmE
         GrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=dvyG2HikKVAqZ3Pld7hfYovEOH+8ytMaQq67ZyyM48o=;
        b=IRJu1KMI9dq2uYfEoOyW7IVDTxdsEMXwj5bGodLfmuqPGsqATNjuZWvpQIx+XDzfXg
         E46bZ/Eg0+nxF2WKAZGyCoNgSD0fEtsVsfGyFEe2Rog21jyaWly+9Le+ydfZFdeP/fgO
         Edd88Ro1aLWAuJHgynUfP3ZsS4/Vkrk9ge/QfBo2VIV/HX9sEmbABfyMSw4DLxiHopD7
         lh4htQQK3wisRtJkpv3jCMVBrR25umfBua0K4G4gZJvOnMNaCipkhMoOmwIvZ9OunJpd
         ydkmS5AviqGYkXZxstOuyEbVi4mFb4/7y4SiCgqqN5jmzF2cd0l2BYliAcXu9JkwivY5
         NDiQ==
X-Gm-Message-State: APjAAAVky+32Bn2fAreVjK0Wmf0/RiMPm5rocT1nQyZndKHDRxLdJmTM
        TzGnUfr6jQmFQoWGB5NyiQ2TpsTnsLIDYg==
X-Google-Smtp-Source: APXvYqwjhKDBPq0K2s2PH80EEGIkXz0YJrhZZHf7JvSTZJHqDXUSSSFlxkc5qJVcmmJnLDZJJ2ZeaQ==
X-Received: by 2002:a2e:1504:: with SMTP id s4mr1436387ljd.80.1569320312414;
        Tue, 24 Sep 2019 03:18:32 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:4446:e9d8:3187:5029:b7d6:f734])
        by smtp.gmail.com with ESMTPSA id x17sm337184lji.62.2019.09.24.03.18.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 03:18:31 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8996: Update simple-pm-bus
 node name to 'bus'
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Simon Horman <horms+renesas@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190924093609.22895-1-horms+renesas@verge.net.au>
 <20190924093609.22895-4-horms+renesas@verge.net.au>
 <3d9dcd04-b34d-957e-6269-cf39a15b4b27@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <dbfc721b-ca66-edb4-aa87-13e15a9a68f8@cogentembedded.com>
Date:   Tue, 24 Sep 2019 13:18:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <3d9dcd04-b34d-957e-6269-cf39a15b4b27@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09/24/2019 01:15 PM, Sergei Shtylyov wrote:

>> Update simple-pm-bus node name from 'agnoc' to 'bus' reflecting the
>> proposed binding description in json-schema which in turn reflects the ePAR
> 
>    It's ePAPR. BTW, you can now refer to DT spec itself instead -- it was based
> on ePAPR...

https://www.devicetree.org/specifications/

[...]

MBR, Sergei
