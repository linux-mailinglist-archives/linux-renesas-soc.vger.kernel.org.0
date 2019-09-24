Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA60BC593
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2019 12:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388966AbfIXKPz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Sep 2019 06:15:55 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45281 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387644AbfIXKPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 06:15:55 -0400
Received: by mail-lj1-f196.google.com with SMTP id q64so1262950ljb.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Sep 2019 03:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bFNBIwYGXh3W3xec04ohuzNopNX9928SWLsxV+VA2GE=;
        b=L6WIgkbCsuUuThECVuZlkY64LJnAunfugsoz8XjeyZLcCEggai5GSV5u0g1G9xxXwU
         yNniVkBV54dfXNIZP3kjw/iqd2cfTdhQkZgI+C9DT6L7dk37d7Upx8ibD4EounfcCYG5
         l+//3FX1bm28oeQrtj8lwlkN7eEzJ4E2lLaKVKTUb9oDvMXHlc/u3XDsR3aWk22h7Ijt
         CuSgzhBoHWZ3iikAnxZYW1fPyKUbOOR2NMeyaCd3m9BbS1UkQb147OBXuJYeYgLjRfXf
         IA+kQTYXcMRIHpg93pcMBZeFnHxRPiGDKfkBHYaE7qeZe4EuWaAqkCOp0m9/Zp0RNrz5
         4CKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bFNBIwYGXh3W3xec04ohuzNopNX9928SWLsxV+VA2GE=;
        b=iZ7aM51ecWSvqwetjzQ2gwVG++s+cn2mKOLfZuNQGy+19F1YdMpOyMJWwLOTnLCyh9
         zWRh2Da99wl2lbrSs68dylPe7HQqiGycgJH9cwP1mrDaZ4tiuqt2ffekAn7ZeA8/wdBh
         rnywEnbhJ8JtKhwgxnYMA67IDpDjzcB61geXcHFWi228azXCPDnnkbOMP+QW458QGKH3
         BkBsTj9AuEkDaH3ubeD/5LFEjMHD8FwEktJOd7MrxseHNjijBiLeXq5GWfxKDXvp0RzM
         OtI7JD9UoVCpID7siegvthiOiR8Zy1IJb2v/Rv8XD/SdS7Oeh2qyu9tn4wOvNPcRqmFm
         pOPA==
X-Gm-Message-State: APjAAAW9zFOpIje7JJfJLHp3ve/UpWyP5bUf+A6EqJZOOL1/Vf8eZq4f
        en7bCFhVL9t9pLUg6R7iAXeW/DB8kat2kg==
X-Google-Smtp-Source: APXvYqwKDNgngzgmWt1lYRBKRHdrylqVvc3sFKBkxNaGdFkIqDe+rxcoE8Gx4AB/uhCYNKqeRKNB2Q==
X-Received: by 2002:a2e:9854:: with SMTP id e20mr1489432ljj.72.1569320151290;
        Tue, 24 Sep 2019 03:15:51 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:4446:e9d8:3187:5029:b7d6:f734])
        by smtp.gmail.com with ESMTPSA id b21sm357198lff.96.2019.09.24.03.15.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 03:15:50 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8996: Update simple-pm-bus
 node name to 'bus'
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
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <3d9dcd04-b34d-957e-6269-cf39a15b4b27@cogentembedded.com>
Date:   Tue, 24 Sep 2019 13:15:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190924093609.22895-4-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 09/24/2019 12:36 PM, Simon Horman wrote:

> Update simple-pm-bus node name from 'agnoc' to 'bus' reflecting the
> proposed binding description in json-schema which in turn reflects the ePAR

   It's ePAPR. BTW, you can now refer to DT spec itself instead -- it was based
on ePAPR...

> standard - "the name of a node should be somewhat generic, reflecting the
> function of the device and not its precise programming model."
> 
> Also drop the unit address as there is neither a reg property nor
> non-empty ranges.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

MBR, Sergei
